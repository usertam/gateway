#!/bin/sh
dnscrypt-proxy -config /etc/dnscrypt-proxy.toml &
dnsmasq -k --log-queries
