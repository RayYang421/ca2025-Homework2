#include <stdint.h>

#define REC_INV_SQRT_CACHE (16)

static uint32_t compute_inverse_sqrt(uint32_t x);

static const uint32_t inv_sqrt_cache[REC_INV_SQRT_CACHE] = {
    ~0U,        ~0U, 3037000500u, 2479700525u,
    2147483647u, 1920767767u, 1753413056u, 1623345051u,
    1518500250u, 1431655765u, 1358187914u, 1294981364u,
    1239850263u, 1191209601u, 1147878294u, 1108955788u
};

/*
 * Newton iteration: new_y = y * (3/2 - x * y^2 / 2)
 * y: Q0.32 fixed-point (< 1.0)
 */
static void newton_step(uint32_t *rec_inv_sqrt, uint32_t x)
{
    uint32_t invsqrt, invsqrt2;
    uint64_t val;

    invsqrt = *rec_inv_sqrt;  /* Dereference pointer */

    /* invsqrt2 = (invsqrt * invsqrt) >> 32;  // Q0.32 */
    invsqrt2 = (uint64_t)invsqrt * invsqrt;
    uint64_t t = (uint64_t)invsqrt * invsqrt;
    invsqrt2 = (uint32_t)(t >> 32);

    /* val = (3 << 32) - x * invsqrt2;  // still Q0.32-ish */
    val = (3ULL << 32) - ((uint64_t)x * invsqrt2);

    /* Avoid overflow in following multiply */
    val >>= 2;

    /* val = (val * invsqrt) >> 31;  // (32 - 2 + 1) */
    val = (val * invsqrt) >> 31;

    *rec_inv_sqrt = (uint32_t)val;
}

static uint32_t compute_inverse_sqrt(uint32_t x)
{
    uint32_t y;

    if (x == 0)
        return ~0U;

    /* Find highest set bit of x */
    int exponent = 31;
    while (exponent > 0 && ((x & (1u << exponent)) == 0))
        exponent--;

    int k = exponent - 3;
    if (k < 0)
        k = 0;

    uint32_t m = x >> k;
    if (m < 1)
        m = 1;
    if (m > 15)
        m = 15;

    /* Initial guess from lookup table */
    y = inv_sqrt_cache[m];

    /* Adjust for odd exponent */
    if (k & 1) {
        uint64_t tmp = (uint64_t)y * inv_sqrt_cache[2];
        y = (uint32_t)(tmp >> 32);
        k--;
    }

    /* Adjust for even exponent: y / 2^(k/2) */
    if (k > 0) {
        y >>= (k >> 1);
    }

    /* Refine with Newton iterations */
    for (int i = 0; i < 15; i++)
        newton_step(&y, x);

    return y;
}

#ifdef HOST_TEST


#include <stdio.h>
#include <math.h>

static void Test(void)
{
    const uint32_t test_values[] = {
        1u, 2u, 3u, 4u, 5u, 7u, 8u, 15u, 16u, 31u,
        25u, 49u, 64u, 81u, 100u, 256u, 1024u,
        12345u, 45678u, 99999u,
        1456465u,
        2000000u,
        5000000u,
        100000000u,
        400000000u,
        2147483647u,        /* INT32_MAX */
        0u                  /* Edge case */
    };

    const int num_tests = sizeof(test_values) / sizeof(test_values[0]);

    for (int i = 0; i < num_tests; ++i) {
        uint32_t x = test_values[i];

        uint32_t raw = compute_inverse_sqrt(x);          /* Q0.32 */
        double approx = (double)raw / (double)(1ULL << 32);
        double exact  = 1.0 / sqrt((double)x);

        printf("x = %10u | raw = %10u | approx = %.10f | exact = %.10f\n",
               x, raw, approx, exact);
    }
}

int main(void)
{
    Test();
    return 0;
}

#else

int main(void)
{
    volatile uint32_t x = 1456465u;
    volatile uint32_t y = compute_inverse_sqrt(x);

    (void)x;
    (void)y;


    return 0;
}

#endif
