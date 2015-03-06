FROM fedora/systemd-systemd

VOLUME /var/lib/libvirt
VOLUME /var/log
VOLUME /run

EXPOSE 16509

RUN yum -y install \
	libvirt \
	qemu \
	qemu-kvm \
	virt-install \
	pygobject3-base \
	; yum clean all

RUN systemctl enable libvirtd
RUN systemctl enable virtlockd

RUN mkdir -p /etc/libvirt/storage
COPY libvirtd.conf /etc/libvirt/libvirtd.conf
COPY pool-default.xml /etc/libvirt/storage/default.xml

RUN echo 'LIBVIRTD_ARGS="--listen"' >> /etc/sysconfig/libvirtd

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/sbin/init"]

