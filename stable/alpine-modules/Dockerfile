FROM alpine:3.18

RUN apk add --no-cache \
    ca-certificates \
    curl

RUN curl -o /etc/apk/keys/angie-signing.rsa \
            https://angie.software/keys/angie-signing.rsa

RUN echo "https://download.angie.software/angie/alpine/v$(egrep -o \
       '[0-9]+\.[0-9]+' /etc/alpine-release)/main" \
       | tee -a /etc/apk/repositories > /dev/null

RUN apk add --no-cache \
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

RUN if [ -f "/etc/apk/keys/angie-signing.rsa" ]; then rm -f /etc/apk/keys/angie-signing.rsa; fi

RUN ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD [ "angie", "-g", "daemon off;"]