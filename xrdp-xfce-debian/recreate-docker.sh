export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120

docker-compose down ; docker-compose up -d --force-recreate --build --remove-orphans
