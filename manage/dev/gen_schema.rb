#!/bin/bash

echo "Regenerating schema.rb for RubyMine..."

./bin/spring stop
SUPPRESS_SCHEMA_FORMAT=1 ./bin/rake db:schema:dump
