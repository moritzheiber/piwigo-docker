# Piwigo Docker/Docker compose

## Prerequisites

- Docker (>= 17.09-9-ce)
- docker-compose (>= 1.16.1)

## Setup

Run

```
$ docker-compose up -d
```

then Piwigo's installation page should be available at [http://localhost:8081](http://localhost:8081).

_Note: It might take a few seconds to be available_

The default value for the database URL is **mysql**, the user is **root** and the password is **piwigo** again. The initial database being created is called **piwigo**.

The rest is for you to choose from.

_Note: The install.php script might fail with a 500 error, but the installation will have succeeded and you can safely navigate back to the original URL and complete your installation._
