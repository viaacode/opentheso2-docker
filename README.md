# opentheso2-docker
Docker config for Opentheso2

## Build the image

Use the build argument `OPENTHESO_VERSION` to set the Opentheso2 version. Defaults to `23.01.01` .

```
docker build \
--build-arg OPENTHESO_VERSION=22.09 \
-t opentheso22-09 .
```

## Build with docker-compose

Or use docker-compose to build the latest version with postgres included.

```
docker-compose up -d --build
```
