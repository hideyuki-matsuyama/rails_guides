FROM postgres:11.5
ARG RUBY_VERSION=2.6.4
ENV PATH=/root/.rbenv/shims:$PATH

RUN set -ex \
    && apt-get update \
    && apt-get install -y \
        rbenv \
        git \
        zlib1g-dev \
        libssl-dev \
        libyaml-dev \
        libreadline6-dev \
        libncurses5-dev \
        libffi-dev \
        libgdbm3 \
        libgdbm-dev \
        autoconf \
        bison \
        build-essential \
        software-properties-common \
    && mkdir -p "$(rbenv root)"/plugins \
    && git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build \
    && mkdir /app

WORKDIR /app

RUN rbenv install $RUBY_VERSION \
    && rbenv global $RUBY_VERSION \
    && gem install bundler \
    && rbenv rehash
COPY Gemfile Gemfile.lock /app/
RUN bundle
COPY . /app/

RUN rubocop
RUN sh /bin/test.sh
