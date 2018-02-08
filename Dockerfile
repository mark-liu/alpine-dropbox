FROM frolvlad/alpine-glibc

MAINTAINER Ralph Slooten <axllent@gmail.com>

USER root

RUN apk add --no-cache ca-certificates python \
     && wget https://www.dropbox.com/download?dl=packages/dropbox.py -O /usr/local/bin/dropbox-cli \
     && chmod +x /usr/local/bin/dropbox-cli

ADD init /init
RUN chmod +x /init
ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /dbox

EXPOSE 17500

ENTRYPOINT ["/sbin/init"]

VOLUME ["/dbox/Dropbox", "/dbox/.dropbox"]

CMD ["/start.sh"]