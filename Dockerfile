FROM alpine:3.16.2

LABEL author="rojberr"
LABEL build_date="11.10.2022"

ENV SWAKS_VERSION=20201014.0

#Install Swaks
RUN set -eux; \
    apk add --update --no-cache \
    perl \
    perl-net-ssleay \
    perl-net-dns \
    curl \
    make \
    tzdata; \
    curl -SLk https://www.jetmore.org/john/code/swaks/files/swaks-$SWAKS_VERSION/swaks -o swaks; \
    chmod +x swaks; \
    yes | perl -MCPAN -e 'install Authen::NTLM'; \
    rm -rf /root/.cpan; \
    apk del make; \
    mv /swaks /usr/bin

# Copy script and attachemtn
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY send-emails-loop.sh /usr/src/app/
COPY attachment.txt /usr/src/app/

CMD [ "sh", "./send-emails-loop.sh" ]