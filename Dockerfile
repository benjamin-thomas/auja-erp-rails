# https://hub.docker.com/_/ruby
FROM ruby:3.0-buster AS base

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update -qq && apt-get install -y \
    nodejs \
    yarn \
    postgresql-client-13 \
  && echo "Packages installed."

RUN useradd --no-create-home --uid 1000 app

RUN mkdir /app
WORKDIR /app

#COPY ./lib/vendor/gems/ /app/lib/vendor/gems/
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ARG RAILS_ENV
RUN if [ "$RAILS_ENV" = "development" -o "$RAILS_ENV" = "test" ] \
  ;then \
    echo "==> Bundling for dev/test and installing dev tools" \
    && bundle install \
    && apt-get install -y tmuxinator vim \
  ;else echo "==> Bundling for prod" \
    && bundle config set --local without 'development test' \
    && bundle install \
  ;fi

FROM base

COPY --chown=app:app . /app

USER app
ENV HOME /app
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
