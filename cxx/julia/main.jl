using Cxx
using Libdl

const LIBRARY_PATH = "../build/libcompas.so"

function perform_sum(input::StridedVector{Float64})::Float64
    Libdl.dlopen(LIBRARY_PATH, Libdl.RTLD_GLOBAL)
    cxxinclude("example.h")

    #@ccall LIBRARY.sum(
    #    input::Ptr{Float64},
    #    stride(input, 1)::Int64,
    #    size(input, 1)::Int64
    #)::Float64
end


x = collect(LinRange(0, 1, 50))
y = perform_sum(x)
display(y)
