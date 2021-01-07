#!/bin/bash
HOSTS="$(dirname $0)/hosts"
curl -o "$HOSTS/energized.gz" https://block.energized.pro/ultimate/formats/hosts.gz
gzip -fd "$HOSTS/energized.gz"
