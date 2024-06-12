if [ -z "${DEBUG}" ]; then
	qemu-system-x86_64 \
	   -m 4G \
	   -smp 4 \
	   -netdev "user,id=net1" \
	   -device "e1000,netdev=net1" \
	   -nographic \
	   -append "console=ttyS0" \
	   -kernel vmlinux \
	   -initrd build/rootfs.cpio
else
	qemu-system-x86_64 \
	   -s \
	   -S \
	   -smp 4 \
	   -m 4G \
	   -nographic \
	   -append "nokaslr console=ttyS0 lsm=lockdown,yama,integrity,apparmor,bpf" \
	   -netdev "user,id=net1" \
	   -device "e1000,netdev=net1" \
	   -kernel vmlinux \
	   -initrd build/rootfs.cpio
fi
