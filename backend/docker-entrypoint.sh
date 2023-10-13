#!/bin/sh

# Change to the app directory
cd /app

# Apply database migrations
echo "Applying database migrations"
poetry run python manage.py makemigrations
poetry run python manage.py migrate --noinput

# Start the server using gunicorn
echo "Starting the server"
poetry run gunicorn k8sdjango.wsgi:application --bind 0.0.0.0:8000