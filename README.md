# db.adamperyman.com

A docker image for adamperyman.com's database.

# Usage
* Data volume must be mounted at `/data/adamperyman/`
* The following env vars are required, valid inputs are via CLI, docker-compose file, or `.env` file in root directory
  - `MONGODB_ADMIN_USER`
  - `MONGODB_ADMIN_PASS`
  - `MONGODB_APPLICATION_DATABASE`
  - `MONGODB_APPLICATION_USER`
  - `MONGODB_APPLICATION_PASS`

<sub>*Many ideas have come from Aashrey Sharma's [docker-mongo-auth](https://github.com/aashreys/docker-mongo-auth) project, and consequently from [this](http://blog.bejanalex.com/2017/03/running-mongodb-in-a-docker-container-with-authentication/) blog post.*</sub>
