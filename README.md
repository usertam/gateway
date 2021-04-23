# Project Gateway
This project was put together for my home Raspberry Pi, to run a DNS server with DoH and custom hosts (blocking/redirecting) capabilities, based on dnsmasq and dnscrypt-proxy. By default, it makes use of Cloudflare DNS servers, as well as ad-blocking hosts files from [Energized Protection]. 

## Populate the ad-blocking hosts
This project uses the "Ultimate Pack" from [Energized Protection], and the entry is listed in ```dnsmasq.conf``` by default. \
Note that it is not included out of the box, run the script to initialize it. 
```sh
bash energized.sh
```

## Stop local resolving services
This project will replace the local resolving services, stop them first before continuing. 
```sh
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
```
Modify the ```/etc/resolv.conf``` so that the system uses this to resolve.
```sh
sudo rm -f /etc/resolv.conf
echo 'nameserver 127.0.0.1' | sudo tee /etc/resolv.conf
```

## Build using docker-compose
```sh
docker-compose up -d
```

## Or, build manually
```sh
docker build --no-cache -t gateway:latest .
docker run -d -v $PWD/hosts:/hosts -p 53:53/tcp -p 53:53/udp --name gateway gateway:latest
```

## Check logs on running container
```sh
docker logs gateway
```

[Energized Protection]: https://energized.pro
