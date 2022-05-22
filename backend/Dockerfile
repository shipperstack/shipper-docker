FROM ubuntu:22.04

# Install base dependencies
RUN apt update \
  && apt upgrade -y \
  && apt install -y --no-install-recommends \
        python3 \
        python3-pip \
        netcat \
        gettext \
        git

# Upgrade pip
RUN pip install --upgrade pip

# Python environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create the shipper user
RUN useradd --create-home shipper

# Environment and work directory setup
ENV HOME=/home/shipper
ENV APP_HOME=/home/shipper/web
WORKDIR $APP_HOME

# Download actual code
RUN git clone --depth 1 https://github.com/shipperstack/shipper .

# Install Python dependencies
RUN pip install -r requirements.txt

# Create mountpoints
RUN mkdir -p $APP_HOME/media && \
    mkdir -p $APP_HOME/static

# chown all the files to the shipper user
RUN chown -R shipper:shipper $APP_HOME

# Change to the shipper user
USER shipper

# Entrypoint
COPY ./entrypoint.sh $APP_HOME
ENTRYPOINT $APP_HOME/entrypoint.sh
