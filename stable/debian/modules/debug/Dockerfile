FROM debian:bookworm-slim

ENV version 1.4.1-1~bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    lsb-release

RUN curl -o /etc/apt/trusted.gpg.d/angie-signing.gpg \
            https://angie.software/keys/angie-signing.gpg

RUN echo "deb https://download.angie.software/angie/debian/ `lsb_release -cs` main" \
       | tee /etc/apt/sources.list.d/angie.list > /dev/null

RUN apt-get update && apt-get install -y --no-install-recommends \
    angie=$version \
    angie-module-auth-jwt-dbgsym=$version \
    angie-module-auth-ldap-dbgsym=$version \
    angie-module-auth-spnego-dbgsym=$version \
    angie-module-brotli-dbgsym=$version \
    angie-module-cache-purge-dbgsym=$version \
    angie-module-dav-ext-dbgsym=$version \
    angie-module-echo-dbgsym=$version \
    angie-module-enhanced-memcached-dbgsym=$version \
    angie-module-eval-dbgsym=$version \
    angie-module-geoip2-dbgsym=$version \
    angie-module-headers-more-dbgsym=$version \
    angie-module-keyval-dbgsym=$version \
    angie-module-lua-dbgsym=$version \
    angie-module-modsecurity-dbgsym=$version \
    angie-module-ndk-dbgsym=$version \
    angie-module-opentracing-dbgsym=$version \
    angie-module-postgres-dbgsym=$version \
    angie-module-redis2-dbgsym=$version \
    angie-module-rtmp-dbgsym=$version \
    angie-module-set-misc-dbgsym=$version \
    angie-module-subs-dbgsym=$version \
    angie-module-testcookie-dbgsym=$version \
    angie-module-upload-dbgsym=$version \
    angie-module-vod-dbgsym=$version \
    angie-module-zip-dbgsym=$version

RUN if [ -f "/etc/apt/trusted.gpg.d/angie-signing.gpg" ]; then rm -f /etc/apt/trusted.gpg.d/angie-signing.gpg; fi

RUN ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

RUN rm -rf /var/lib/apt/lists

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD [ "angie-debug", "-g", "daemon off;" ]