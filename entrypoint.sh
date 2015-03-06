#!/bin/sh

mkdir -p /var/log/libvirt/images

if [ -c /dev/kvm ]; then
	chown qemu:qemu /dev/kvm
else
	echo "*** no /dev/kvm"
fi

exec "$@"

