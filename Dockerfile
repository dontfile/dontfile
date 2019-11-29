FROM ruby:2.6

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       postgresql

WORKDIR /dontfile

COPY . /dontfile

ENTRYPOINT ["./startup.sh"]
