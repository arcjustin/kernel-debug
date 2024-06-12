KERNEL_PATH=~/projects/linux/

default: build/rootfs.cpio vmlinux source

build:
	mkdir -p build

build/rootfs.cpio: rootfs build
	mkdir -p rootfs/modules/
	cp $(KERNEL_PATH)/drivers/net/ethernet/intel/e1000/e1000.ko rootfs/modules/
	cd rootfs/ && find . | cpio -oHnewc > ../build/rootfs.cpio

vmlinux:
	ln -fs $(KERNEL_PATH)/vmlinux vmlinux

source:
	ln -fs $(KERNEL_PATH) source

clean:
	rm -fr rootfs/modules/
	rm -fr build
	rm -f vmlinux source
