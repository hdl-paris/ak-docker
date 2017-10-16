#!/bin/bash

echo "Install node_modules: ak_backend"
docker-compose run ak_backend npm install
echo "Install node_modules: ak_frontend"
docker-compose run ak_frontend npm install
echo "UPDATE DB"
docker-compose run ak_support bundle exec rails db:migrate
echo "Populate elasticsearch"
docker-compose run ak_support bundle exec rails chewy:reset
