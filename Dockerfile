FROM alpine:latest
MAINTAINER Javier Vivanco <javier123mendoza (at) gmail (dot) com>
RUN apk update
RUN apk add --no-progress \
    ca-certificates \
    nginx
RUN rm -rf /etc/nginx
ADD etc /etc
ADD entrypoint.sh /usr/local/bin/
RUN mkdir /tmp/nginx

EXPOSE 80
EXPOSE 443


ENTRYPOINT ["entrypoint.sh"]
