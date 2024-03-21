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
    angie-module-auth-jwt \
    angie-module-auth-ldap \
    angie-module-auth-spnego \
    angie-module-brotli \
    angie-module-cache-purge \
    angie-module-dav-ext \
    angie-module-echo \
    angie-module-enhanced-memcached \
    angie-module-eval \
    angie-module-geoip2 \
    angie-module-headers-more \
    angie-module-keyval \
    angie-module-lua \
    angie-module-modsecurity \
    angie-module-ndk \
    angie-module-opentracing \
    angie-module-postgres \
    angie-module-redis2 \
    angie-module-rtmp \
    angie-module-set-misc \
    angie-module-subs \
    angie-module-testcookie \
    angie-module-upload \
    angie-module-vod \
    angie-module-zip

RUN if [ -f "/etc/apt/trusted.gpg.d/angie-signing.gpg" ]; then rm -f /etc/apt/trusted.gpg.d/angie-signing.gpg; fi

RUN ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

RUN rm -rf /var/lib/apt/lists

COPY config.patch /tmp
RUN patch -p1 < /tmp/config.patch

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD [ "angie", "-g", "daemon off;" ]