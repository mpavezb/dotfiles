# GDB

- See also rr project: https://rr-project.org/

## Compilation 

### Flags

- `-std=c99`
- `-g0, -g1, -g, -g3`: Amount of debug information: None, minimal, default, maximal.
- `-l`: Link a library. e.g.: `-lm` (math), `-l<>`
- `-Wall, -w` : Enable/Supress all Warnings

```bash
gcc -g -std=c99 -w primes_buggy.c -o primes -lm
```


### .gdbinit

```
set history save on
set print pretty on
set pagination off
set confirm off
```


## Debugging Crashes

### From inside gdb

After crash happened:

```bash
# show backtrace
(gdb) bt

# move in backtrace
(gdb) up
(gdb) down
```

### From outside gdb

This requires creating a coredump file.

```bash
# Inspect ulimit and enable coredumps 
ulimit -a
ulimit -c unlimited

# Create coredump by running the binary
./buggy_executable_compiled_with_debug_flags

# Run in gdb
gdb ./buggy_executable_compiled_with_debug_flags ./core
(gdb) bt
```
