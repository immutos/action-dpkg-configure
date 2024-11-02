VERSION 0.8

all:
  ARG VERSION=dev
  BUILD --platform=linux/amd64 --platform=linux/arm64 --platform=linux/riscv64 +docker

lint:
  FROM koalaman/shellcheck-alpine:v0.10.0
  WORKDIR /workspace
  COPY ./*.sh ./
  RUN shellcheck *.sh

docker:
  FROM debian:trixie-slim
  RUN apt update \
    && apt install -y fakechroot \
    && rm -rf /var/lib/apt/lists/*
  COPY LICENSE /usr/share/doc/action-dpkg-configure/copyright
  COPY dpkg-configure.sh /usr/local/bin/dpkg-configure.sh
  RUN chmod +x /dpkg-configure.sh
  ENTRYPOINT ["/usr/local/bin/dpkg-configure.sh"]
  ARG VERSION=dev
  SAVE IMAGE --push ghcr.io/immutos/action-dpkg-configure:${VERSION}
  SAVE IMAGE --push ghcr.io/immutos/action-dpkg-configure:latest