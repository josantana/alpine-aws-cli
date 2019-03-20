FROM alpine:3.7

RUN apk update

# Install base and dev packages
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install aws-cli
RUN apk --no-cache add python py-pip py-setuptools ca-certificates groff less
RUN pip --no-cache-dir install awscli
RUN apk --purge -v del py-pip
RUN rm -rf /var/cache/apk/*

CMD ["/bin/bash"]
