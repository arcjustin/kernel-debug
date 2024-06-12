KERNEL_PATH=~/projects/linux/

default: build/rootfs.cpio vmlinux source

build:
	mkdir -p build

build/rootfs.cpio: rootfs build
	cd rootfs/ && find . | cpio -oHnewc > ../build/rootfs.cpio

vmlinux:
	ln -fs $(KERNEL_PATH)/vmlinux vmlinux

source:
	ln -fs $(KERNEL_PATH) source

clean:
	rm -fr build
	rm -f vmlinux source
