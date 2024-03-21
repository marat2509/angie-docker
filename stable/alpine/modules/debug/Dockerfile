FROM alpine:3.18

ENV version 1.4.1-r0

RUN apk add --no-cache \
    ca-certificates \
    curl \
    patch

RUN curl -o /etc/apk/keys/angie-signing.rsa \
            https://angie.software/keys/angie-signing.rsa

RUN echo "https://download.angie.software/angie/alpine/v$(egrep -o \
       '[0-9]+\.[0-9]+' /etc/alpine-release)/main" \
       | tee -a /etc/apk/repositories > /dev/null

RUN apk add --no-cache \
    angie=$version \
    angie-module-auth-jwt=$version \
    angie-module-auth-ldap=$version \
    angie-module-auth-spnego=$version \
    angie-module-brotli=$version \
    angie-module-cache-purge=$version \
    angie-module-dav-ext=$version \
    angie-module-echo=$version \
    angie-module-enhanced-memcached=$version \
    angie-module-eval=$version \
    angie-module-geoip2=$version \
    angie-module-headers-more=$version \
    angie-module-keyval=$version \
    angie-module-lua=$version \
    angie-module-modsecurity=$version \
    angie-module-ndk=$version \
    angie-module-opentracing=$version \
    angie-module-postgres=$version \
    angie-module-redis2=$version \
    angie-module-rtmp=$version \
    angie-module-set-misc=$version \
    angie-module-subs=$version \
    angie-module-testcookie=$version \
    angie-module-upload=$version \
    angie-module-vod=$version \
    angie-module-zip=$version

# RUN if [ -f "/etc/apk/keys/angie-signing.rsa" ]; then rm -f /etc/apk/keys/angie-signing.rsa; fi

RUN ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

COPY config.patch /tmp

RUN patch -p1 < /tmp/config.patch
RUN rm -f /tmp/config.patch
EXPOSE 80

STOPSIGNAL SIGQUIT

CMD [ "angie", "-g", "daemon off;"]