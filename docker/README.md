# Usage

## Build
Please build the base image by running
```bash
sh build-base.sh
```

Build the remaining service images
```bash
docker-compose build
```

## Run
```bash
d - detachment mode; no logs

docker-compose up [-d]
```

## Destroy
```bash
docker-compose down
```

## Check status
Go to `http://localhost:8090/kafkacruisecontrol/state`
