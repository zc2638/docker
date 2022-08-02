FROM golang:1.18-alpine as builder

ENV GOPROXY=https://goproxy.cn,direct
ENV GO111MODULE=on
ENV CGO_ENABLED=1

RUN apk add --no-cache --virtual .build-deps \
    ca-certificates \
    gcc \
    g++ \
    make

WORKDIR /work
ADD . .
RUN make build

FROM alpine:3.6

RUN apk --update upgrade && \
    apk add sqlite && \
    mkdir /lib64 && \
    ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && \
    rm -rf /var/cache/apk/*

ENV TZ="Asia/Shanghai"
COPY --from=builder /work/ticket /usr/local/bin/ticket
COPY --from=builder /work/config/config.yaml /work/config/config.yaml

WORKDIR /work
CMD ["ticket", "-c", "config/config.yaml"]