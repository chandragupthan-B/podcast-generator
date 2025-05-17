FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install Python 3.10 and required system packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python package with override for PEP 668
RUN pip3 install --break-system-packages pyyaml

# Copy scripts
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
