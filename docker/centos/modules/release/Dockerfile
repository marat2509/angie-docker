FROM centos:latest

COPY angie.repo /etc/yum.repos.d/angie.repo

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

RUN yum install -y patch

RUN yum install -y --skip-broken angie \
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

RUN yum clean all

RUN if [ -f "/etc/yum.repos.d/angie.repo" ]; then rm -f /etc/yum.repos.d/angie.repo; fi

RUN ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

COPY config.patch /tmp/config.patch

RUN patch -p1 < /tmp/config.patch
RUN rm -f /tmp/config.patch

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD [ "angie", "-g", "daemon off;" ]