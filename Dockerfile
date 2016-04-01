FROM debian:jessie

MAINTAINER esz@outlook.com

ENV OPENFIRE_VERSION 4.0.2

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y locales \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y openjdk-7-jre wget postgresql\
  && wget "http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_${OPENFIRE_VERSION}_all.deb" -O /tmp/openfire_${OPENFIRE_VERSION}_all.deb \
  && dpkg -i /tmp/openfire_${OPENFIRE_VERSION}_all.deb \
  && rm -rf openfire_${OPENFIRE_VERSION}_all.deb \
  && apt-get -y clean

ADD startup.bash /startup.bash
RUN chmod 755 /startup.bash

CMD ["/startup.bash"]

EXPOSE 3478
EXPOSE 3479
EXPOSE 5222
EXPOSE 5223
EXPOSE 5229
EXPOSE 5269
EXPOSE 7070
EXPOSE 7443
EXPOSE 7777
EXPOSE 9090
EXPOSE 9091
