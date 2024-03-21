FROM ubuntu:jammy

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    lsb-release \
    patch

RUN curl -o /etc/apt/trusted.gpg.d/angie-signing.gpg \
            https://angie.software/keys/angie-signing.gpg

RUN echo "deb https://download.angie.software/angie/ubuntu/ `lsb_release -cs` main" \
       | tee /etc/apt/sources.list.d/angie.list > /dev/null

RUN apt-get update && apt-get install -y --no-install-recommends \
    angie \
    angie-module-auth-jwt-dbgsym \
    angie-module-auth-ldap-dbgsym \
    angie-module-auth-spnego-dbgsym \
    angie-module-brotli-dbgsym \
    angie-module-cache-purge-dbgsym \
    angie-module-dav-ext-dbgsym \
    angie-module-echo-dbgsym \
    angie-module-enhanced-memcached-dbgsym \
    angie-module-eval-dbgsym \
    angie-module-geoip2-dbgsym \
    angie-module-headers-more-dbgsym \
    angie-module-keyval-dbgsym \
    angie-module-lua-dbgsym \
    angie-module-modsecurity-dbgsym \
    angie-module-ndk-dbgsym \
    angie-module-opentracing-dbgsym \
    angie-module-postgres-dbgsym \
    angie-module-redis2-dbgsym \
    angie-module-rtmp-dbgsym \
    angie-module-set-misc-dbgsym \
    angie-module-subs-dbgsym \
    angie-module-testcookie-dbgsym \
    angie-module-upload-dbgsym \
    angie-module-vod-dbgsym \
    angie-module-zip-dbgsym

RUN if [ -f "/etc/apt/trusted.gpg.d/angie-signing.gpg" ]; then rm -f /etc/apt/trusted.gpg.d/angie-signing.gpg; fi

RUN ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

RUN rm -rf /var/lib/apt/lists

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD [ "angie-debug", "-g", "daemon off;" ]