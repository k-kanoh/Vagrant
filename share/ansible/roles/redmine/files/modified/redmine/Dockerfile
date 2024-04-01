FROM ruby:3.1-alpine3.17

LABEL maintainer="yoshinorin"

RUN apk update --no-cache \
  && apk add --no-cache --virtual build-dependencies libffi-dev build-base \
  && apk add --no-cache mysql-client tzdata mariadb-dev linux-headers imagemagick-dev \
  && apk add --no-cache git \
  && mkdir -p /usr/src/app/redmine \
  && mkdir -p /usr/src/app/redmine/tmp/pids

WORKDIR /usr/src/app/redmine
COPY ./src /usr/src/app/redmine
COPY docker-entrypoint.sh /usr/src/app/redmine
COPY Gemfile /usr/src/app/redmine

RUN gem install bundler --no-document \
  && bundle install --jobs=10 --without development test \
  && bundle exec rake generate_secret_token \
  && chmod 0700 docker-entrypoint.sh \
  && apk del --purge build-dependencies \
  && rm -rf /var/cache/apk/*

ENTRYPOINT "/usr/src/app/redmine/docker-entrypoint.sh"

EXPOSE 3000
