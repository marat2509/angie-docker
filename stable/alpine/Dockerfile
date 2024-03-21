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
    angie

RUN if [ -f "/etc/apk/keys/angie-signing.rsa" ]; then rm -f /etc/apk/keys/angie-signing.rsa; fi

RUN ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD [ "angie", "-g", "daemon off;"]