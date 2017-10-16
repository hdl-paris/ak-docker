#!/bin/bash

echo "Install node_modules: ak_backend"
docker-compose run ak_backend npm install
echo "Install node_modules: ak_frontend"
docker-compose run ak_frontend npm install
echo "UPDATE DB"
docker-compose run ak_support bundle exec rails db:migrate
# Webpack
echo "compiling common assets..."
docker-compose run ak_templates ./node_modules/.bin/cross-env ID="commons" STAGE=development NODE_ENV=development ./node_modules/.bin/webpack --progress --config=./node_modules/laravel-mix/setup/webpack.config.js
echo "compiling pharmacy assets..."
docker-compose run ak_templates ./node_modules/.bin/cross-env ID="43891" STAGE=development NODE_ENV=development ./node_modules/.bin/webpack --progress --config=./node_modules/laravel-mix/setup/webpack.config.js
echo "push pharmacy assets"
docker-compose run ak_frontend bundle exec rails templating:push_assets[43891] --trace
