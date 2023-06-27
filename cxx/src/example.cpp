#include "example.h"

double sum(double* input, int64_t stride, int64_t length) {
    double result = 0;

    for (int64_t i = 0; i < length; i++) {
        result += input[i * stride];
    }

    return result;
}
