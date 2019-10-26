# BASH README

## Command line fuzzy finder

https://github.com/junegunn/fzf

## Bash prompt

This prompt shows git information whenever available. 

### Profiling

Some delay issues have been found when using in large repositories. The table below shows elapsed time used to generate the prompt for the [Rust repository](https://github.com/rust-lang/rust).

The time is measured using the `time` BASH command.

| Version | Time     | Description                                    |
| ------- | -------- | ---------------------------------------------- |
| 0.0     | 0m0,012s | No git prompt.                                 | 
| 1.0     | 0m2,259s | First implementation (bash).                   |
| 1.1     | 0m0,800s | Add `--ignore-submodules` to git status calls. |
| 1.2     | 0m0,440s | Add `--ignore-submodules` to git diff calls.   |
