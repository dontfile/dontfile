<p align="center">
  <img style="text-align:center;" src="public/dontfile.png" width=150 height=150>
  <h3 align="center">Dontfile</h3>
</p>

<p align="center">
  <i>The dontpad of files</i>
  <br>
  <br>
  <a href="https://github.com/dontfile/dontfile/actions/workflows/ci.yml">
    <img src="https://github.com/dontfile/dontfile/actions/workflows/ci.yml/badge.svg" alt="CI">
  </a>
  <a href="https://github.com/dontfile/dontfile/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
  </a>
</p>

Dontfile is an open source website to store and share text and files (up to 100MB) using URL paths. It saves the text while you type, and other visitors of the same URL see the changes immediately.

## Tech/Framework used

Dontfile is a [Ruby on Rails](https://rubyonrails.org/) app. It uses SQLite, [Hotwire](https://hotwired.dev/) (Turbo and Stimulus) and Active Storage.

## Features

- Collaboration using URLs
- Text saved automatically
- Live updates for other visitors of the same page
- File storage
- Download of the page text and file as `YourURL.zip`

## Development

### Prerequisites

- Ruby (see [`.ruby-version`](.ruby-version))
- SQLite 3

### Setup

```bash
bin/setup
```

This command installs the gems, prepares the database and starts the server on http://localhost:3000.

### Configuration

[`config/dontfile.yml`](config/dontfile.yml) holds the app settings, such as the file size limit.

## Tests

The unit and controller tests:

```bash
bin/rails test
```

The system tests (they use headless Chrome):

```bash
bin/rails test:system
```

All the CI checks (style, security and tests):

```bash
bin/ci
```

## Docker

```bash
docker build -t dontfile .
docker run -d -p 80:80 -e SECRET_KEY_BASE=$(bin/rails secret) -v dontfile-storage:/rails/storage dontfile
```

The `storage` volume keeps the SQLite databases and the uploaded files. The production configuration expects HTTPS in front of the container.

## Contribute
Did you find a bug or want to contribute to Dontfile? See [CONTRIBUTING.md](.github/CONTRIBUTING.md) for details on how to get started.

## Credits

Dontfile was inspired by [dontpad](http://dontpad.com) philosophy.

Icons are from [Bootstrap Icons](https://icons.getbootstrap.com/) (MIT).

## License
Dontfile is under the [MIT License](LICENSE)! You can download, change and share the source code!

MIT © [Matheus Richard](https://github.com/MatheusRich)
