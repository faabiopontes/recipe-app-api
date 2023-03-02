FROM python:3.9-alpine3.13
LABEL maintainer="github.com/faabiopontes"

# Ensures that the Python output (stdout/stderr)
# Are sent straight to terminal
# https://stackoverflow.com/questions/59812009/what-is-the-use-of-pythonunbuffered-in-docker-file
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

# Creates a argument with a default value
# Which might be updated by docker-compose afterwards if necessary
ARG DEV=false

# Run commands inside image from line 1
# Create virtual environment to avoid conflicting dependencies
RUN python -m venv /py && \
  # Upgrade pip for the venv we just created
  /py/bin/pip install --upgrade pip && \
  # Install requirements
  /py/bin/pip install -r /tmp/requirements.txt && \
  if [ $DEV = "true" ]; \
    then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
  fi && \
  # Remove temporary folder to keep image as light as possible
  rm -rf /tmp && \
  # Create user inside image so we are not using root
  adduser \
  # No need for password since we are only logging through application
  --disabled-password \
  # No need for home directory, again to keep it light
  --no-create-home \
  # Defines new user name
  django-user

# Add py packages to path
ENV PATH="/py/bin:$PATH"

# Image will run using the last user we switch to
# Which is this
USER django-user
