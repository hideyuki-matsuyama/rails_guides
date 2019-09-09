#!/bin/bash

rc-service postgresql start
rails db:create db:migrate
bundle exec rspec
