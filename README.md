Options for Julia-C++ interoperability
===

ccall
-----
Directly call C functions from shared lib using native Julia
+ No library needed
- Tedious to write all function definitions
- Fragile since function definition might change and requires updating Julia file


Cxx.jl
---
The Julia C++ foreign function interface package

- Does not compile under Julia >1.4
- Not maintained

Cpp.jl
---
Simple utilities for calling C++ from Julia

- Not maintained for 10 years


CxxInterface.jl
------------
The design of CxxInterface.jl is simpler than either Cxx.jl or CxxWrap.jl: Wrapper functions are written in Julia, and they generate respective C++ wrapper functions via string manipulation that are called via ccall

* TODO


CxxCall.jl
------------
CxxCall.jl is just syntactic sugar on top of CxxInterface.jl. The actual work is done by CxxInterface.jl.


* TODO

CBinding.jl
--------------
Generate Julia bindings from C header file

* TODO

CBindingGen.jl
--------------
Older version of CBinding.jl


jluna
-----
 Julia Wrapper for C++ with Focus on Safety, Elegance, and Ease of Use

- Seems to be only for from C++ to Julia?


Cxxwrap.jl
-------
This package aims to provide a Boost.Python-like wrapping for C++ types and functions to Julia. The idea is to write the code for the Julia wrapper in C++, and then use a one-liner on the Julia side to make the wrapped C++ library available there.

+ Maintained
+ Similar to pybind11
+ Seems well tested
- Must write wrapper in C++


Rust: jlrs
----------
Julia bindings for Rust

+ Host code would be in rust (easy Lightning integration)
- Package seems to be in development still


