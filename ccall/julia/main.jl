const LIBRARY = "../build/libcompas.so"

function perform_sum(input::StridedVector{Float64})::Float64
    @ccall LIBRARY.sum(
        input::Ptr{Float64},
        stride(input, 1)::Int64,
        size(input, 1)::Int64
    )::Float64
end


x = collect(LinRange(0, 1, 50))
y = perform_sum(x)
display(y)
