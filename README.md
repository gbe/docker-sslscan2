# docker-sslscan2
sslscan2 dockerized on Alpine by building the sources from https://github.com/rbsec/sslscan

To run this image: docker run gbellier/docker-sslscan2 wikipedia.org:443

The author presents his tool as follows:
sslscan version 2 has now been released. This includes a major rewrite of the backend scanning code, which means that it is no longer reliant on the version of OpenSSL for many checks. This means that it is possible to support legacy protocols (SSLv2 and SSLv3), as well as supporting TLSv1.3 - regardless of the version of OpenSSL that it has been compiled against.

This has been made possible largely by the work of jtesta, who has been responsible for most of the backend rewrite.

Other key changes include:
- Enumeration of server key exchange groups.
- Enumeration of server signature algorithms.
- SSLv2 and SSLv3 protocol support is scanned, but individual ciphers are not.
- A test suite is included using Docker, to verify that sslscan is functionality correctly."
