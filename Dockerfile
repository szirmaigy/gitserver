FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG="C"

RUN rm -f /etc/localtime \
 && ln -s /usr/share/zoneinfo/Europe/Budapest /etc/localtime \
 && echo "Europe/Budapest" > /etc/timezone \
 && apt-get update \
 && apt-get -y dist-upgrade \
 && apt-get -y install language-pack-en language-pack-hu curl \
                       git openssh-server \
 && apt-get -y purge curl \
 && apt-get --purge -y autoremove

COPY gitserver.sh /usr/local/bin/
COPY sshd_config /etc/ssh/

WORKDIR /opt/repos

CMD ["/user/local/bin/gitserver.sh"]

