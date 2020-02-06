# Piwigo Docker/Docker compose

## Prerequisites

- Docker (>= 18.03-1-ce)
- docker-compose (>= 1.20.1)

## Setup

Run

```
$ docker build -t piwigo-docker ./
$ docker-compose up -d
```

then Piwigo's installation page should be available at [http://localhost:8000](http://localhost:8000).

_Note: It might take a few seconds to be available_

The default value for the database URL is **mysql**, the user is **piwigo** and the password is **piwigo** again. The initial database being created is called **piwigo**.

The rest is for you to choose from.
