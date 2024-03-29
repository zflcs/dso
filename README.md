# dso

This is a library of dynamic shared object.

### The runtime library

It provides the runtime of kernel and user process. The kernel must load this module when it initiate and the user process must link this module when created.

This module depends on `alloc` and `dealloc` function to use the heap of kernel or user process relatively.

It exports some basic functions such as `spawn`, `poll_future`, `wake_task` and so on.

### How to add a new dynamic shared object

1. Create a new `cdylib` library.
2. Copy the `build.rs` script in your library.
3. Add the `info.txt` in your library just follow the `info.txt` in runtime library. But you must change the `exported_symbols` to your own funtions.

### About

You must use the `riscv64gc-unknown-linux-gnu` toolchain to compile this repository. All dynamic shared object are static linked with `glibc` (The related config is under the `.cargo/config.toml` file). If you replace the configuration `rustflags = ["-Clink-args=-nostartfiles -Bstatic -l:libc.a"]` with `rustflags = ["-Clink-args=-nostartfiles"]`, some basic functions such as `memcpy`, `memset` will not be compiled into this dynamic shared object, then you will dynamic linked those functions when kernel or user process initiate.