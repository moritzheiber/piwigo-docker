FROM alpine:3.10.3
LABEL maintainer="Moritz Heiber <hello@heiber.im>"

ENV PIWIGO_VERSION="2.10.1" \
  PIWIGO_CHECKSUM="4967bc5ebca1eae5b20cdd5849dc2e1628e281c400d73d12d116d4381e4d432b"

RUN set -x && apk --no-cache add curl php7 php7-gd php7-mysqli php7-session && \
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
