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

### Description

Dontfile is an open source project intended to concatenate the proposed idea of [dontpad](dontpad.com) aggregating the same logic to files along with texts, thus creating a more complete tool.

* Ruby version: 2.4.1
* Rails version: 5.2.0

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
