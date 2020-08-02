CGO_ENABLED=0 GOOS=linux GOARCH=arm go build -o inlets-arm
CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o inlets-arm64
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o inlets-amd64
docker buildx build -t docker.fredriklowenhamn.se/easyserver-inlets:latest-arm --platform linux/arm/v7 -f ./Dockerfile-arm . --push
docker buildx build -t docker.fredriklowenhamn.se/easyserver-inlets:latest-arm64 --platform linux/arm64 -f ./Dockerfile-arm64 . --push
docker buildx build -t docker.fredriklowenhamn.se/easyserver-inlets:latest-amd64 --platform linux/amd64 -f ./Dockerfile-amd64 . --push
docker manifest create docker.fredriklowenhamn.se/easyserver-inlets:latest docker.fredriklowenhamn.se/easyserver-inlets:latest-arm docker.fredriklowenhamn.se/easyserver-inlets:latest-arm64 docker.fredriklowenhamn.se/easyserver-inlets:latest-amd64
docker manifest push docker.fredriklowenhamn.se/easyserver-inlets:latest