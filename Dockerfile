FROM ruby:2.4-alpine

ENV \
  RAILS_ROOT="/var/www/rest-api" \
  RAILS_ENV="production" \
  SECRET_KEY_BASE="cd5fe10e2eb6ad82106fa0b38eff6321e2745810aae019620ad715a6648b5100f0e69c0c5ca8b025dbb6bfadc51e21a8ee1ae31da9e81dd1a3f00c2f18b93b7a"

RUN apk --quiet --no-cache add \
      build-base \
      libxml2-dev \
      libxslt-dev \
      nodejs \
      postgresql-dev \
      postgresql-client

RUN mkdir -p $RAILS_ROOT/tmp/pids

WORKDIR $RAILS_ROOT

# Always run bundler before copying the application source code.
# This avoids invalidating Docker's cache too soon.
COPY Gemfile ./
RUN gem install bundler && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle install --quiet --binstubs --jobs 20 --retry 3

COPY . ./

EXPOSE 3000

ENTRYPOINT [ "bundle", "exec" ]
CMD [ "rails", "server", "-p", "3000", "-b", "0.0.0.0" ]
