FROM alpine:3.17

# Install base dependencies
RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
        python3 \
        python3-dev \
        py3-pip \
        netcat-openbsd \
        gettext \
        git \
        postgresql-client

# Upgrade pip
RUN pip3 install --upgrade pip

# Python environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create the shipper user
RUN adduser --disabled-password --home /home/shipper --shell /bin/sh shipper

# Environment and work directory setup
ENV HOME=/home/shipper
ENV APP_HOME=/home/shipper/web
WORKDIR $APP_HOME

# Allow setting a custom branch to download
ARG BRANCH=master

# Download actual code
RUN git clone --branch $BRANCH --depth 1 https://github.com/shipperstack/shipper .

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Create mountpoints
RUN mkdir -p $APP_HOME/media && \
    mkdir -p $APP_HOME/static

# chown all the files to the shipper user
RUN chown -R shipper:shipper $APP_HOME

# Change to the shipper user
USER shipper

# Entrypoint
COPY ./entrypoint.sh $APP_HOME
ENTRYPOINT ["/home/shipper/web/entrypoint.sh"]
