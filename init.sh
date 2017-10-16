#!/bin/bash

echo "Install node_modules: ak_backend"
docker-compose run ak_backend npm install
echo "Install node_modules: ak_frontend"
docker-compose run ak_frontend npm install
echo "Install node_modules: ak_templates"
docker-compose run ak_templates npm install
echo "INIT DB"
docker-compose run ak_support bundle exec rails db:schema:load
docker-compose run ak_support bundle exec rails db:migrate
echo "Restore DB"
docker exec -i ak_postgres sh restore_database.sh
docker exec -i ak_postgres sh restore_ak_dump.sh
echo "Populate elasticsearch"
# docker-compose run ak_support bundle exec rails chewy:reset
# Webpack
echo "compiling common assets..."
docker-compose run ak_templates ./node_modules/.bin/cross-env ID='common' STAGE=production NODE_ENV=development ./node_modules/.bin/webpack --progress --config=./node_modules/laravel-mix/setup/webpack.config.js
echo "compiling pharmacy assets..."
docker-compose run ak_templates ./node_modules/.bin/cross-env ID=43891 STAGE=production NODE_ENV=development ./node_modules/.bin/webpack --progress --config=./node_modules/laravel-mix/setup/webpack.config.js
echo "push pharmay assets"
docker-compose run ak_frontend bundle exec rails templating:push_assets[43891] --trace
