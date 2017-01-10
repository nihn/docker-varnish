FROM alpine:3.5

ENV VARNISH_VERSION='4.1.3-r0'

RUN apk add --update --no-cache varnish=$VARNISH_VERSION gettext wget && \
    wget --no-check-certificate https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 -O /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init && \
    apk del wget

ENV VARNISH_CONFIG='default.vcl'\
    VARNISH_PORT='80'\
    VARNISH_BACKEND_NAME='default'\
    VARNISH_BACKEND_HOST='localhost'\
    VARNISH_BACKEND_PORT='8080'

COPY default.vcl entrypoint.sh ./
ENTRYPOINT ["dumb-init", "./entrypoint.sh"]
