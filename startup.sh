#!/bin/sh

bundle check || bundle install

while ! pg_isready -h $PG_HOST -p $PG_PORT -q -U $PG_USERNAME; do
  >&2 echo "Postgres is unavailable - sleeping..."
  sleep 5
done
>&2 echo "Postgres is up - executing commands..."

if [ -f $pidfile ] ; then
  echo 'Server PID file exists. Removing it...'
  rm $pidfile
fi

# If database exists, migrate. Otherwise, create and seed
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup db:seed
echo "Database setup complete! Running the server."

bundle exec rails s -p 3000 -b 0.0.0.0
