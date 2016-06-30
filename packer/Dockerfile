FROM        debian:jessie
MAINTAINER  tomislacker

ARG         PACKER_VERSION

RUN         apt-get update \
            && apt-get install --no-install-recommends -qq \
                ca-certificates \
                wget \
                unzip

ENV         PACKER_VERSION ${PACKER_VERSION:-0.10.1}
RUN         wget \
                -O /tmp/packer.zip \
                https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
            && cd /usr/local/bin \
            && unzip /tmp/packer.zip

ENTRYPOINT  ["/usr/local/bin/packer"]
CMD         ["build", "packer.json"]
