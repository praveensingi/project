#!/bin/bash

echo "Collecting static files"
python manage.py collectstatic --noinput


# Apply database migrations
echo "Applying database migrations"
python manage.py migrate

# Start your application
exec "$@"