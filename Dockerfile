FROM alpine

LABEL maintainer="simoin <lfzeng34@gmail.com>"

RUN apk update --no-cache \
    && apk add --no-cache build-base libffi-dev libressl-dev libxslt-dev squid
RUN sed -i 's/http_access deny all/http_access allow all/g' /etc/squid/squid.conf
RUN cp /etc/squid/squid.conf /etc/squid/squid.conf.backup
RUN apk add --no-cache python3 python3-dev \
  && pip3 install --upgrade pip setuptools \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*

WORKDIR /haipproxy
COPY . /haipproxy

RUN pip install -r requirements.txt
# CMD ['python', 'crawler_booter.py', '--usage', 'crawler', 'common']