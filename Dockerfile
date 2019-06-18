FROM debian:stable

RUN apt-get update && apt-get install --no-install-recommends -y apt-transport-https lsb-release ca-certificates net-tools lsof wget vim-nox \
    && apt-get autoremove -y && apt-get clean

ARG ETCDVER=3.3.13
RUN wget -q https://github.com/etcd-io/etcd/releases/download/v${ETCDVER}/etcd-v${ETCDVER}-linux-amd64.tar.gz -O /tmp/etcd.tar.gz \
    && tar -xvzf /tmp/etcd.tar.gz -C /tmp \
    && mv /tmp/etcd-v${ETCDVER}-linux-amd64/etcd* /usr/local/bin/ \
    && chmod 755 /usr/local/bin/etcd* \
    && rm -rf /tmp/*


ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV ETCDCTL_API=3

VOLUME [ "/var/lib/etcd" ]

EXPOSE 2379

CMD /usr/local/bin/etcd --advertise-client-urls 'http://0.0.0.0:2379' --listen-client-urls 'http://0.0.0.0:2379' --data-dir /var/lib/etcd
