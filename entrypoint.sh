#!/bin/sh

set -e

envsubst < ${VARNISH_CONFIG} > /etc/varnish/default.vcl

exec varnishd -F -f /etc/varnish/default.vcl -a 0.0.0.0:${VARNISH_PORT} "$@"
