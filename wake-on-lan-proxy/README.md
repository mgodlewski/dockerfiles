## Usage:

```
docker run \
  --net=host \
  -p 8080:8080 \
  -e SOURCE_PORT=8080 \
  -e TARGET_PORT:80 \
  -e TARGET_HOST=192.168.0.123 \
  -e TARGET_MAC=aa:bb:cc:dd:ee:ff \
  -e WAKEUP_TIMEOUT=60000 \
  mgodlewski/wake_on-lan-proxy
```

