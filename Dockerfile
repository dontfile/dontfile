FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /dontfile

COPY Gemfile /dontfile/Gemfile

COPY Gemfile.lock /dontfile/Gemfile.lock

RUN bundle install

COPY . /dontfile

EXPOSE 3000
