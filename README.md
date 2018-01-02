# db.adamperyman.com

A docker image for adamperyman.com's database.

# Usage
* Start in background: `docker-compose up -d`
* Data volume must be mounted at `/data/adamperyman/`
* The following env vars are required, valid inputs are via CLI, docker-compose file, or `.env` file in root directory
  - `MONGODB_ADMIN_USER`
  - `MONGODB_ADMIN_PASS`
  - `MONGODB_APPLICATION_DATABASE`
  - `MONGODB_APPLICATION_USER`
  - `MONGODB_APPLICATION_PASS`
