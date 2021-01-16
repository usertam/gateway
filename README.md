# Project Gateway
This project was put together for my home Raspberry Pi, to run a DNS server with DoH and custom hosts (blocking/redirecting) capabilities, based on dnsmasq and dnscrypt-proxy. By default, it makes use of Cloudflare DNS servers, as well as host files from [Energized Protection]. 

## Download hosts
Fetch the "Ultimate Pack" from [Energized Protection], and store the hosts file ```energized``` under ```hosts/```. 
```sh
bash energized.sh
```

## Build docker image
```sh
docker build --no-cache -t gateway:latest .
```

## Stop/disable resolving services on port 53
```sh
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
```

## Run built docker image
```sh
docker run -d \
    -v $PWD/hosts:/hosts \
    -p 53:53/tcp -p 53:53/udp \
    --name gateway \
    gateway:latest
```

Or if you prefer a simple oneliner:
```sh
docker run -d -v $PWD/hosts:/hosts -p 53:53/tcp -p 53:53/udp --name gateway gateway:latest
```

## Check logs on running container
```sh
docker logs gateway
```

[Energized Protection]: https://energized.pro
