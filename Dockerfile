# DOCKER-VERSION 1.0.0

FROM strider/strider-docker-slave

USER root
RUN apt-get install -y autoconf build-essential libreadline-dev libssl-dev libyaml-dev zlib1g-dev wget
RUN \
  mkdir -p /tmp && \
  cd /tmp && \
  wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz && \
  tar -xzvf ruby-2.1.5.tar.gz && \
  cd ruby-2.1.5 && \
  ./configure --disable-install-doc && \
  make --jobs `nproc` && \
  make install && \
  cd / && \
  rm -rv /tmp/ruby-2.1.5.tar.gz /tmp/ruby-2.1.5
RUN gem install bundler

USER strider
