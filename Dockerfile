# Setting Global ARG for both Builds
ARG     version_no=v1
ARG     directory=/app

# 1st Build
FROM    golang:1.7.3 AS builder
ARG     version_no=v1 
ARG     directory
ENV     version_no_for_build=${version_no}
ENV     dir=$directory 
WORKDIR ${dir}
COPY    hello_v1.go hello_v2.go ./
RUN     go get -u github.com/gorilla/mux  && \
        CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./${version_no_for_build}/hello  hello_${version_no_for_build}.go

# 2nd Build
# Using Scratch image for less or no image size.
FROM   scratch
ARG    version_no
ARG    directory
ENV    directory=${directory}
ENV    version_no=${version_no}
COPY   --from=builder ${directory}/${version_no}/hello ${directory}/
COPY   --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
CMD    [ "/app/hello" ] 
