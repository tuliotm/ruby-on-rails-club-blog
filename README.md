# Blog Monolith Project

Project developed to practice.

## Environment Setup

Make sure you have the following versions installed:

- Ruby: 3.3.0
- Rails: 7.1.3.2
- Bundler: 2.5.6

## Install project dependencies:
```bash
bundle install
```

**--------------- The first time only, follow the instructions below. ---------------**

* Run to build tailwind:
```console
./bin/dev
```

## Now you can start the server normally:
```bash
rails server
```

## Run the seeds to populate the database:
```bash
rails db:dev_reset
```