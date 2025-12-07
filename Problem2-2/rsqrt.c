#include<stdio.h>
#include<stdint.h>
#include<math.h>

#define REC_INV_SQRT_CACHE (16)

static uint32_t compute_inverse_sqrt(uint32_t x);

static const uint32_t inv_sqrt_cache[REC_INV_SQRT_CACHE] = {
    ~0U,        ~0U, 3037000500, 2479700525,
    2147483647, 1920767767, 1753413056, 1623345051,
    1518500250, 1431655765, 1358187914, 1294981364,
    1239850263, 1191209601, 1147878294, 1108955788
};


/*
 * Newton iteration: new_y = y * (3/2 - x * y^2 / 2)
 * Here, y is a Q0.32 fixed-point number (< 1.0)
 */
static void newton_step(uint32_t *rec_inv_sqrt, uint32_t x)
{
    uint32_t invsqrt, invsqrt2;
    uint64_t val;

    invsqrt = *rec_inv_sqrt;  /* Dereference pointer */
    invsqrt2 = ((uint64_t)invsqrt * invsqrt) >> 32;
    val = (3LL << 32) - ((uint64_t)x * invsqrt2);

    val >>= 2; /* Avoid overflow in following multiply */
    val = (val * invsqrt) >> 31;  /* Right shift by 31 = (32 - 2 + 1) */

    *rec_inv_sqrt = (uint32_t)val;
}

static uint32_t compute_inverse_sqrt(uint32_t x)
{
    uint32_t y;

    if (x == 0)
        return ~0U;

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

    y = inv_sqrt_cache[m];

    if (k & 1) {
        uint64_t tmp = (uint64_t)y * inv_sqrt_cache[2];
        y = (uint32_t)(tmp >> 32);
        k--;
    }

    if (k > 0) {
        y >>= (k >> 1);
    }

    for (int i = 0; i < 15; i++)
        newton_step(&y, x);

    return y;
}


static void Test(){

    const uint32_t test_values[] = {

        1u, 2u, 3u, 4u, 5u, 7u, 8u, 15u, 16u, 31u,


        25u, 49u, 64u, 81u, 100u, 256u, 1024u,

        12345u, 45678u, 99999u,
        1456465u,
        2000000u,
        5000000u,


        100000000u,
        400000000u,
        2147483647u,        // INT32_MAX

        
        0u,                 // Edge cases
    };

    const int num_tests = sizeof(test_values) / sizeof(test_values[0]);

    for (int i = 0; i < num_tests; ++i) {
        uint32_t x = test_values[i];

        uint32_t raw = compute_inverse_sqrt(x);          // Q0.32
        double approx = (double)raw / (double)(1ULL << 32);
        double exact = 1.0 / sqrt((double)x);

        printf("x = %10u | raw = %10u | approx = %.10f | exact = %.10f\n",
               x, raw, approx, exact);
    }

}

int main(){
    
    Test();

    return 0;
}