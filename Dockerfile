# vim:set ft=dockerfile:

# VERSION 1.0
# AUTHOR:         Gregory Bellier <gregory.bellier@gmail.com>
# DESCRIPTION:    sslscan2 in a Docker container
# TO_BUILD:       docker build --rm -t gbellier/docker-sslscan2 .

FROM alpine:3.11
MAINTAINER Gregory Bellier "gregory.bellier@gmail.com" 

# build sslscan2
RUN \
	apk --update-cache add --virtual build-dependencies git libcrypto1.1 build-base perl zlib-dev linux-headers && \
	git clone -b sslscan2 https://github.com/rbsec/sslscan.git && \
	cd sslscan && \
	make clean && \ 
	sed -ni "/sslscan: \$(SRCS)/{p;n;s/$/ -D __USE_GNU/};p" Makefile && \
	make static && \
	make install && \
	cd / && \
	rm -rf /sslscan && \
	apk del build-dependencies

ENTRYPOINT ["/usr/bin/sslscan"]
