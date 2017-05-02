#!/bin/bash
set -e

# This should be done with docker-compose, but not enough time

DOCKER_REDIS_NAME=redis-48h
DOCKER_REDIS_PORT=6379
DOCKER_REDIS_HOST_STORAGE="/data/redis/48h"

DOCKER_POSTGRES_NAME=postgres-48h
DOCKER_PG_PORT=5432

docker run --name "$DOCKER_POSTGRES_NAME" \
    -p "$DOCKER_PG_PORT":"$DOCKER_PG_PORT" \
    -e POSTGRES_PASSWORD=challenge -d postgres

docker run --name "$DOCKER_REDIS_NAME" \
    -p "$DOCKER_REDIS_PORT":"$DOCKER_REDIS_PORT" \
    -v "$DOCKER_REDIS_HOST_STORAGE":/data \
    -d redis redis-server --appendonly yes

