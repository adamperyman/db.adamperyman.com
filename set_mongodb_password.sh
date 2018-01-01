#!/bin/bash

# Admin User
MONGODB_ADMIN_USER=${MONGODB_ADMIN_USER:-"admin"}
MONGODB_ADMIN_PASS=${MONGODB_ADMIN_PASS:-"1234"}

# Application Database User
MONGODB_APPLICATION_DATABASE=${MONGODB_APPLICATION_DATABASE:-"admin"}
MONGODB_APPLICATION_USER=${MONGODB_APPLICATION_USER:-"adam"}
MONGODB_APPLICATION_PASS=${MONGODB_APPLICATION_PASS:-"1234"}

# Wait for MongoDB to boot
RET=1
while [[ RET -ne 0 ]]; do
  echo "=> Waiting for confirmation of MongoDB service startup..."
  sleep 5
  mongo admin --eval "help" > /dev/null 2>&1
  RET=$?
done

# Create admin user
echo "=> Creating admin user.."
mongo admin --eval "db.createUser({ user: '$MONGODB_ADMIN_USER', pwd: '$MONGODB_ADMIN_PASS', roles: [{ role: 'root', db: 'admin' }] })"

sleep 3

# Create user for MONGODB_APPLICATION_DATABASE if necessary.
if [ "$MONGODB_APPLICATION_DATABASE" != "admin" ]; then
  echo "=> Creating a ${MONGODB_APPLICATION_DATABASE} database user.."
  mongo admin -u ${MONGODB_APPLICATION_USER} -p ${MONGODB_APPLICATION_PASS} << EOF
echo "Using $MONGODB_APPLICATION_DATABASE.."
use $MONGODB_APPLICATION_DATABASE
db.createUser({ user: '$MONGODB_APPLICATION_USER', pwd: '$MONGODB_APPLICATION_PASS', roles: [{ role: 'dbOwner', db '$MONGODB_APPLICATION_DATABASE' }] })
EOF
fi

sleep 1

touch /data/db/.mongodb_password_set

echo "=> MongoDB configured successfully."
