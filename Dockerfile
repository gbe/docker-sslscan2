# vim:set ft=dockerfile:

# AUTHOR:         Gregory Bellier <gregory.bellier@gmail.com>
# DESCRIPTION:    sslscan2 supports legacy protocols (SSLv2/v3), as well as supporting TLSv1.3
# TO_BUILD:       docker build --rm -t gbellier/docker-sslscan2 .
# TO_RUN:	  docker run gbellier/docker-sslscan2 www.wikipedia.org:443

FROM alpine:3.12
MAINTAINER Gregory Bellier "gregory.bellier@gmail.com" 

RUN \
	apk add --no-cache --virtual build-dependencies git make perl gcc libc-dev zlib-dev linux-headers && \
	git clone -b 2.0.0-beta3 --depth 1 https://github.com/rbsec/sslscan.git && \
	cd sslscan && \
	make clean && \ 
	make static && \
	make install && \
	cd / && \
	rm -rf /sslscan && \
	apk del --no-cache build-dependencies

USER nobody

ENTRYPOINT ["/usr/bin/sslscan"]
