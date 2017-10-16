#!/bin/bash

bundle exec rails db:schema:load
bundle exec rails db:migrate
