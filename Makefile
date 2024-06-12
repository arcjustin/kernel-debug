KERNEL_PATH=~/projects/linux/
SENSORDIR=$(CSROOT)/private/sensor/

default: build/rootfs.cpio vmlinux source

.PHONY: $(INSTALLER)

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
