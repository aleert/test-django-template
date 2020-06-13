#!/usr/bin/env sh

PG_HOST=db
PG_PORT=5432
PG_DB={{cookiecutter.project_name}}
PG_PASSWORD=`head -c 18 /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | head -c 12`
PG_USER=`head -c 18 /dev/urandom | base64 | tr -dc 'a-z' | head -c 12`
PG_SERVICE_NAME=postgres
# Used only by django:
DJANGO_DATABASE_DOCKER_HOST=db
DJANGO_DATABASE_LOCAL_HOST=localhost
DJANGO_DATABASE_PORT=5432
DJANGO_SECRET_KEY=`head -c 75 /dev/urandom | base64 | head -c 50`
DJANGO_SUPERUSER_USERNAME=admin
DJANGO_SUPERUSER_PASSWORD=admin_password
DJANGO_SUPERUSER_EMAIL=admin@email.me
DJANGO_SETTINGS_MODULE=server.settings.local

echo "DJANGO_SECRET_KEY=$DJANGO_SECRET_KEY
DJANGO_SUPERUSER_USERNAME=$DJANGO_SUPERUSER_USERNAME
DJANGO_SUPERUSER_PASSWORD=$DJANGO_SUPERUSER_PASSWORD
DJANGO_SUPERUSER_EMAIL=$DJANGO_SUPERUSER_EMAIL
DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
USE_DOCKER=yes" > .envs/.local/.django/.django


echo "DJANGO_SECRET_KEY=$DJANGO_SECRET_KEY
DJANGO_SUPERUSER_USERNAME=$DJANGO_SUPERUSER_USERNAME
DJANGO_SUPERUSER_PASSWORD=$DJANGO_SUPERUSER_PASSWORD
DJANGO_SUPERUSER_EMAIL=$DJANGO_SUPERUSER_EMAIL
DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE" > .envs/.local/.django/.env


echo "CREATE USER $PG_USER  WITH PASSWORD '$PG_PASSWORD';
CREATE DATABASE $PG_DB OWNER $PG_USER ENCODING 'utf-8';" > ./sql/create_database.sql

echo "DROP DATABASE $PG_DB;
DROP USER $PG_USER;" > ./sql/drop_database.sql


echo "POSTGRES_HOST=$PG_HOST
POSTGRES_PORT=$PG_PORT
POSTGRES_DB=$PG_DB
POSTGRES_PASSWORD=$PG_PASSWORD
POSTGRES_USER=$PG_USER
" > .envs/.local/.postgres/.postgres
