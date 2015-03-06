FROM fedora

ENV container=docker

VOLUME /var/lib/libvirt
VOLUME /var/log
VOLUME /run

RUN yum -y install \
	libvirt \
	qemu \
	virt-install \
	pygobject3-base

RUN mkdir -p /etc/libvirt/storage
COPY libvirtd.conf /etc/libvirt/libvirtd.conf
COPY pool-default.xml /etc/libvirt/storage/default.xml

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/libvirtd"]

