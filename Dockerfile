FROM ruby:2.5

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock

RUN bundle install
COPY . /usr/src/app/
