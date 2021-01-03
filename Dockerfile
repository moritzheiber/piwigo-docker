FROM alpine:3.10.3
LABEL maintainer="Moritz Heiber <hello@heiber.im>"

ENV PIWIGO_VERSION="2.10.2" \
  PIWIGO_CHECKSUM="0de75de7da9d9b8058e208cf78d6f20852a790fca6d8231d432f3f62d12939ff"

RUN set -x && apk --no-cache add curl php7 php7-gd php7-mysqli php7-json php7-session && \
  curl -Lo /tmp/piwigo.zip "http://piwigo.org/download/dlcounter.php?code=${PIWIGO_VERSION}" && \
  echo "${PIWIGO_CHECKSUM}  /tmp/piwigo.zip" | sha256sum -wsc - && \
  adduser -h /piwigo -DS piwigo && \
  unzip /tmp/piwigo.zip -d /piwigo && \
  install -d -o piwigo /piwigo/piwigo/galleries /piwigo/piwigo/upload && \
  chown -R piwigo /piwigo/piwigo/local && \
  apk --no-cache del curl && \
  rm /tmp/piwigo.zip

WORKDIR /piwigo
USER piwigo

CMD ["php","-S","0.0.0.0:8000","-t","piwigo"]
