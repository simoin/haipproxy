FROM alpine

LABEL maintainer="simoin <lfzeng34@gmail.com>"

WORKDIR /haipproxy
COPY . /haipproxy

RUN apk update --no-cache && \
    apk add --no-cache build-base libffi-dev libressl-dev libxslt-dev squid python3 python3-dev && \
    pip3 install --upgrade pip setuptools && \
    pip install -r requirements.txt && \
    sed -i 's/http_access deny all/http_access allow all/g' /etc/squid/squid.conf && \
    cp /etc/squid/squid.conf /etc/squid/squid.conf.backup && \
    which python3|xargs -i ln -s {} /usr/bin/python

# CMD ['python', 'crawler_booter.py', '--usage', 'crawler', 'common']