 <p align="center">
  <img style="text-align:center;" src="public/dontfile.png" width=150 height=150>
  <h3 align="center">Dontfile</h3>
</p>

<p align="center">
  <i>The dontpad of files</i>
  <br>
  <br>
  <a href="https://travis-ci.org/MatheusRich/dontfile">
    <img src="https://travis-ci.org/MatheusRich/dontfile.svg?branch=master" alt="Build Status">
  </a>
  <a href="https://codeclimate.com/github/MatheusRich/dontfile/maintainability">
    <img src="https://api.codeclimate.com/v1/badges/786863e9b71eab0a50e9/maintainability" alt="Maintainability">
  </a>
  <a href="https://codeclimate.com/github/MatheusRich/dontfile/test_coverage">
    <img src="https://api.codeclimate.com/v1/badges/786863e9b71eab0a50e9/test_coverage" alt="Test Coverage">
  </a>
  <a href="https://github.com/MatheusRich/dontfile/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
  </a>
</p>

# Dontfile

Website to store and share text and files (up to 20MB) using URL paths. Continuously saves data as you type. Hosted at http://dontfile.com

## Motivation

[Dontpad](http://dontpad.com) has similar functionality with text but is not open source. Dontfile builds on the idea of dontpad with extra features such as file uploads.

## Screenshots

![dontfile screenshot](https://i.imgur.com/ltqRqUl.png)

## Tech/framework used

Dontfile is built with [Ruby](https://www.ruby-lang.org/en/) language with the [Ruby on Rails](https://rubyonrails.org/) web framework

## Features

- Active storage
- Collaboration using URLs
- Text saved automatically
- File storage

## Installation

### Local installation

#### Prerequisites

- Ruby version: 2.5.1
- Rails version: 5.2.1

#### Install latest bundler

Install [bundler](https://bundler.io/)

```bash
gem install bundler
```

#### Bundle the necessary gems

```bash
bundle install
```

#### Create the database

```bash
rails db:create
```

#### Migrate the database

```bash
rails db:migrate
```

#### Run the server

```bash
rails server
```

### Docker

#### Prerequisites for docker

An installation of [Docker](https://docs.docker.com/install/)

#### Steps

Run docker compose

```bash
docker-compose up -d
```

Navigate to http://localhost:3000

## Tests

```bash
rails test
```

## Contribute

See [CONTRIBUTING.md](.github/CONTRIBUTING.md) for details on how to contribute.

## Credits

Dontfile was inspired by [dontpad](http://dontpad.com) philosophy.

## License

MIT © [Matheus Richard](https://github.com/MatheusRich)

See [LICENSE](LICENSE) for details
