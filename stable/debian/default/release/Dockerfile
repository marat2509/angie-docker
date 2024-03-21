FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    lsb-release

RUN curl -o /etc/apt/trusted.gpg.d/angie-signing.gpg \
            https://angie.software/keys/angie-signing.gpg

RUN echo "deb https://download.angie.software/angie/debian/ `lsb_release -cs` main" \
       | tee /etc/apt/sources.list.d/angie.list > /dev/null

RUN apt-get update && apt-get install -y --no-install-recommends \
    angie

RUN if [ -f "/etc/apt/trusted.gpg.d/angie-signing.rsa" ]; then rm -f /etc/apt/trusted.gpg.d/angie-signing.rsa; fi

RUN ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

RUN rm -rf /var/lib/apt/lists

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD [ "angie", "-g", "daemon off;" ]