FROM mariadb:10.3.8

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Budapest LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get dist-upgrade -y \
  && apt-get install -y \
  locales \
  tzdata \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone \
  && echo "en_US UTF-8" >/etc/locale.gen \
  && echo "en_US.UTF-8 UTF-8" >>/etc/locale.gen \
  && locale-gen \
  && apt-get clean all
