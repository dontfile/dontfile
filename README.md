# Dontfile
[![Build Status](https://travis-ci.org/MatheusRich/dontfile.svg?branch=master)](https://travis-ci.org/MatheusRich/dontfile)
[![Maintainability](https://api.codeclimate.com/v1/badges/786863e9b71eab0a50e9/maintainability)](https://codeclimate.com/github/MatheusRich/dontfile/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/786863e9b71eab0a50e9/test_coverage)](https://codeclimate.com/github/MatheusRich/dontfile/test_coverage)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/MatheusRich/dontfile/blob/master/LICENSE)

![](https://i.imgur.com/ODwqvvM.jpg)

The dontpad of files.

* Ruby version: 2.4.1
* Rails version: 5.2.0

### Description

Dontfile is an open source project intended to concatenate the proposed idea of [dontpad](dontpad.com) aggregating the same logic to files along with texts, thus creating a more complete tool.

### Setting up development environment

1. Make sure you have correct Ruby 2.4.1 version, either with [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv)

2. Install latest bundler

```bash 
gem install bundler
```

3. Bundle the necessary gems

```bash 
bundle install
```

4. Create the database

```bash 
rails db:create
```

5. Migrate the database

```bash
rails db:migrate
```

6. Run the server

```bash
rails server
```
