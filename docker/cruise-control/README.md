# Usage
## Run the following:
docker build -t ski:cruise-control .
docker run -dit --entrypoint /bin/bash ski:cruise-control
## To execute bash in the container
docker run -it ski:cruise-control /bin/bash
