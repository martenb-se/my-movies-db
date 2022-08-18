#!/bin/bash
# ~~~~~~~ Get Environment
source env.load.sh

# ~~~~~~~ Execution
# Check if container exists first
if ! docker container inspect "$DEV_DOCKER_CONTAINER_NAME" &>/dev/null; then
  echo "Docker container $DEV_DOCKER_CONTAINER_NAME does not appear to exist! Make sure to run the compose file before running any tests!"
  exit 1
fi

# Check if container is running
if ! docker container inspect "$DEV_DOCKER_CONTAINER_NAME" | grep -Pzo '"State": {[^}]+}' | grep -aEq '"Running":[ ]+true'; then
  echo "Docker container $DEV_DOCKER_CONTAINER_NAME does not appear to be running! Make sure the container is running and that the health checks passed!"
  exit 1
fi

# Run pgTAP on database
docker compose -f docker-compose.yml run --rm pgtap
