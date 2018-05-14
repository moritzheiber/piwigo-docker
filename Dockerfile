FROM alpine:3.7
LABEL maintainer="Moritz Heiber <hello@heiber.im>"

ENV PIWIGO_VERSION="2.9.3" \
  PIWIGO_CHECKSUM="4022a743ddc0555f8d4f114ec3c3aa439eec44659cbf0d1564d0e3cc2ff30426"

RUN apk --no-cache add php7 php7-gd php7-mysqli php7-session && \
  wget http://piwigo.org/download/dlcounter.php?code=2.9.3 -O /tmp/piwigo.zip && \
  echo "${PIWIGO_CHECKSUM}  /tmp/piwigo.zip" | sha256sum -c - && \
  adduser -h /piwigo -DS piwigo && \
  unzip /tmp/piwigo.zip -d /piwigo && \
  chown piwigo /piwigo/piwigo/galleries /piwigo/piwigo/upload && \
  rm /tmp/piwigo.zip

WORKDIR /piwigo
USER piwigo

CMD ["php","-S","0.0.0.0:8000","-t","piwigo"]
