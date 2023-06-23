
module Compas
    using CxxWrap

    const LIBRARY = "../build/libcompas.so"
    @wrapmodule(LIBRARY, :define_julia_module)
end


x = collect(LinRange(0, 1, 50))
y = Compas.sum(x)
display(y)
