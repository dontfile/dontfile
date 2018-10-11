 <p align="center">
  <img style="text-align:center;" src="public/dontfile.png" width=150 height=150>
  <h3 align="center">Dontfile</h3>
</p>

# Dontfile

Website to store and share text and files (up to 20MB) using URL paths. Continuously saves data as you type. Hosted at http://dontfile.com

## Motivation

[Dontpad](http://dontpad.com) has similar functionality with text but is not open source. Dontfile builds on the idea of dontpad with extra features such as file uploads.

## Build status

<p align="center">
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
 
## Screenshots

![dontfile screenshot](https://i.imgur.com/ltqRqUl.png)

## Tech/framework used

<b>Built with</b>

- [Rails](https://rubyonrails.org/)

<<<<<<< HEAD

## Features

=======
Dontfile is an open source project intended to concatenate the proposed idea of [dontpad](http://dontpad.com/) aggregating the same logic to files along with texts, thus creating a more complete tool.

> > > > > > > f733752e978ccd11fda794dbfd9d4ddc817fd1bf

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

Fork and make a pull request

## Credits

The idea is thanks to [dontpad](http://dontpad.com)

## License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so...

MIT © [Matheus Richard]()
