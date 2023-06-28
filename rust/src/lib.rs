use jlrs::prelude::*;

type ArrayRef<'scope, 'data, T, const N: isize = 1> = jlrs::data::managed::array::TypedRankedArray<'scope, 'data, T, N>;

unsafe extern "C"
fn sum(input: ArrayRef<f64>) -> f64 {
    //input.iter().sum()
    0.0
}

julia_module! {
    become initialize_fn;

    fn sum(input: ArrayRef<f64>) -> f64;
}

