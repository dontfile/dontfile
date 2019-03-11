#!/bin/sh

bundle check || bundle install

# wait for postgresql
# until nc -z -v -w30 $DB_HOST 5432
# do
#   echo 'Waiting for PostgreSQL...'
#   sleep 1
# done
# echo "PostgreSQL is up and running"

pidfile='/dontfile/tmp/pids/server.pid'
if [ -f $pidfile ] ; then
  echo 'Server PID file exists. Removing it...'
  rm $pidfile
fi

# If database exists, migrate. Otherwise, create and seed
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup db:seed
echo "Database setup complete! Running the server."

bundle exec rails s -p 3000 -b 0.0.0.0
