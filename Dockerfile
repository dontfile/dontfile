FROM ruby:2.5.1

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       postgresql

WORKDIR /dontfile

COPY . /dontfile

ENTRYPOINT ["./startup.sh"]
