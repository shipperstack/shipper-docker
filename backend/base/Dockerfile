FROM ubuntu:22.04

# Install base dependencies
RUN apt update \
  && apt upgrade -y \
  && apt install -y --no-install-recommends \
        python3
        python3-pip
        netcat
        gettext

# Install Python dependencies
RUN pip install --upgrade pip

