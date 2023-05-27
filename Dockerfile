FROM python:3.9-slim

MAINTAINER "Neo Peng <pengzhile@gmail.com>"

VOLUME /data

WORKDIR /opt/app

ADD . .

RUN pip --no-cache-dir install --upgrade pip && pip --no-cache-dir install .[api,cloud]

RUN sed -i 's/\r$//' /opt/app/bin/startup.sh

RUN chmod +x /opt/app/bin/startup.sh

ENTRYPOINT ["bin/startup.sh"]
