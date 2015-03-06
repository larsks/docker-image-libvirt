FROM fedora

VOLUME /var/lib/libvirt
VOLUME /var/log
VOLUME /run

RUN yum -y install \
	libvirt \
	qemu \
	virt-install \
	pygobject3-base

RUN mkdir -p /etc/libvirt/storage
COPY pool-default.xml /etc/libvirt/storage/default.xml
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

