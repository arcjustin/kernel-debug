# QEmu Kernel Debugger
A small init system and set of scripts for debugging the Linux kernel in qemu.

# Requirements
- `qemu` - Used to virtualize the target kernel.
   - Install via `brew` on MacOS or through your package manager on Linux.
- `dpkg-deb` - Used to extract packages into the initramfs.
   - Install via `brew` on MacOS or through your package manager on Linux.

# Compiling / Setup
1. Checkout and compile a Linux kernel.
2. Set `KERNEL_PATH` in `Makefile` to the kernel repository.
3. Invoke `make` to compile the initramfs and setup symlinks for qemu.

## Debug Mode
1. Invoke run in debug mode: `DEBUG=1 ./run.sh`.
2. Start `gdb` from the repository's root: `gdb ./vmlinux`.
3. Connect `gdb` to `qemu`: `target remote :1234`.
4. And continue: `c`.

## Normal Mode
1. Invoke run in normal mode: `./run.sh`.
2. Kernel will boot.
