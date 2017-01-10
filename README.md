# docker-varnish #
Minimal Docker image for Varnish service based on Alpine image.

## Quick start ##
```
docker run -p 8080:80 mateuszm/varnish
```
Varnish will be available on localhost:8080.

## Configuration ##

### Environment variables ###
```
VARNISH_CONFIG          path to default Varnish config file ['default.vcl']
VARNISH_PORT            port on which Varnish will listen inside container [80]
VARNISH_BACKEND_NAME    default backend name ['default']
VARNISH_BACKEND_HOST    default backend host ['localhost']
VARNISH_BACKEND_PORT    default backend port ['8080']
```

### Passing arguments to varnishd command ###
Just pass it to docker run:
```
docker run mateuszm/varnish -n /tmp
```

### Custom config file ###
Copy it to image and set its name as `$VARNISH_CONFIG` environment variable.
This file will be first formatted with environment variables with `envsubst`.
