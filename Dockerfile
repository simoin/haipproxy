FROM alpine

LABEL maintainer="simoin <lfzeng34@gmail.com>"

RUN apk update && apk add gcc libressl-dev libffi-dev musl-dev libxslt-dev squid
RUN sed -i 's/http_access deny all/http_access allow all/g' /etc/squid/squid.conf
RUN cp /etc/squid/squid.conf /etc/squid/squid.conf.backup
RUN apk add python3 python3-pip
RUN which python3|xargs -i ln -s {} /usr/bin/python
RUN which pip3|xargs -i ln -s {} /usr/bin/pip
WORKDIR /haipproxy
COPY . /haipproxy

RUN pip install -r requirements.txt
CMD ['python', 'crawler_booter.py', '--usage', 'crawler', 'common']