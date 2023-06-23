#include "jlcxx/jlcxx.hpp"
#include "jlcxx/array.hpp"
#include "example.h"

double sum(double* input, int64_t stride, int64_t length) {
    double result = 0;

    for (int64_t i = 0; i < length; i++) {
        result += input[i * stride];
    }

    return result;
}

JLCXX_MODULE define_julia_module(jlcxx::Module& mod)
{
  mod.method("sum", [](jlcxx::ArrayRef<double> in) {
    return sum(in.data(), 1, in.size());
  });
}
