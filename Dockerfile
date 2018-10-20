FROM ruby:2.5.1

RUN apt-get update -qq &&\
    apt-get install -y build-essential libpq-dev nodejs poppler-utils ffmpeg

WORKDIR /dontfile

COPY . /dontfile

RUN bundle install

EXPOSE 3000

ENTRYPOINT ["./startup.sh"]
