# Profiling

## Profiling: Startup

- Built-In
  - `M-x emacs-init-time`
- ESUP: https://github.com/jschaf/esup
  - `M-x esup`
- Benchmark Init: https://github.com/dholm/benchmark-init-el
  - `M-x benchmark-init/show-durations-tabulated`
  - `M-x benchmark-init/show-durations-tree`

### Results

- Take care of the desktop:
  - `desktop-save-mode` is responsible for 99% of the startup time.
  - This is proportional to the number of buffers.
  - Load buffers lazily.
  - Clean buffers automatically/manually.
- Don't do anything network related:
  - Dont refresh package list.
  - Disable automatic download and installation.
- Don't `require` packages on init:
  - Setup defered initializations for big packages.
  - Setup autoloads for the entry functions.
- Compile packages and .el files: `M-x emacs-lisp-byte-compile`.
