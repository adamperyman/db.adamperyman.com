# DEPRECATED

Use [happy-mongodb](https://github.com/x0bile/happy-mongodb) instead :)

--

# db.adamperyman.com

A mongo image with authorisation for adamperyman.com.

# Usage
* Data volume must be mounted at `/data/adamperyman/`
* The following env vars are required, valid inputs are via CLI, docker-compose file, or `.env` file in root directory
  - `MONGODB_ADMIN_USER`
  - `MONGODB_ADMIN_PASS`
  - `MONGODB_APPLICATION_DATABASE`
  - `MONGODB_APPLICATION_USER`
  - `MONGODB_APPLICATION_PASS`

## Docker Image

Can be found [here](https://hub.docker.com/r/adamperyman/db.adamperyman.com/).

```
$ docker pull adamperyman/db.adamperyman.com
```
