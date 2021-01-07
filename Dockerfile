FROM alpine:latest

RUN apk --no-cache add \
    dnsmasq \
    dnscrypt-proxy

COPY ./dnsmasq.conf /etc/
COPY ./dnscrypt-proxy.toml /etc/
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME /hosts

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/entrypoint.sh"]
