# vim:set ft=dockerfile:

# AUTHOR:         Gregory Bellier <gregory.bellier@gmail.com>
# DESCRIPTION:    sslscan2 in a Docker container
# TO_BUILD:       docker build --rm -t gbellier/docker-sslscan2 .
# TO_RUN:	  docker run gbellier/docker-sslscan2 google.com:443

FROM alpine:3.11
MAINTAINER Gregory Bellier "gregory.bellier@gmail.com" 

RUN \
	apk add --no-cache --virtual build-dependencies git libcrypto1.1 build-base perl zlib-dev linux-headers && \
	git clone --depth 1 https://github.com/rbsec/sslscan.git && \
	cd sslscan && \
	make clean && \ 
	make static && \
	make install && \
	cd / && \
	rm -rf /sslscan && \
	apk del --no-cache build-dependencies

ENTRYPOINT ["/usr/bin/sslscan"]
