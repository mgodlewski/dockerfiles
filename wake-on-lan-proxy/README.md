This image supports on arm and adm64 architectures.

## Usage:

```
docker run \
  --net=host \
  -e SOURCE_PORT=8080 \
  -e TARGET_PORT:80 \
  -e TARGET_HOST=192.168.0.123 \
  -e TARGET_MAC=aa:bb:cc:dd:ee:ff \
  -e WAKEUP_TIMEOUT=60000 \
  mgodlewski/wake-on-lan-proxy
```

