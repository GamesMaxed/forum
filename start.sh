#!/bin/sh
# Wait for postgres to start
./wait-for-it.sh db:5432

# Setup the database
bundle exec bin/rails db:create
bundle exec bin/rails db:migrate

# Start the server
exec bundle exec bin/rails s -p 3000 -b '0.0.0.0'
