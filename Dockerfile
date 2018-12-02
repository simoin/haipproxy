FROM alpine

LABEL maintainer="simoin <lfzeng34@gmail.com>"

RUN apk update && apk add gcc libressl-dev libffi-dev musl-dev libxslt-dev squid
RUN sed -i 's/http_access deny all/http_access allow all/g' /etc/squid/squid.conf
RUN cp /etc/squid/squid.conf /etc/squid/squid.conf.backup
RUN apk add python3-dev py3-pip
RUN pip install cffi

WORKDIR /haipproxy
COPY . /haipproxy

RUN pip install -i https://pypi.douban.com/simple/ -r requirements.txt
CMD ['python', 'crawler_booter.py', '--usage', 'crawler', 'common']