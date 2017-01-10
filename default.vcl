vcl 4.0;

backend ${VARNISH_BACKEND_NAME} {
   .host = "${VARNISH_BACKEND_HOST}";
   .port = "${VARNISH_BACKEND_PORT}";
}

sub vcl_deliver {
  if (obj.hits > 0) {
    set resp.http.X-Varnish-Cache = "HIT";
  }
  else {
    set resp.http.X-Varnish-Cache = "MISS";
  }
  return (deliver);
}
