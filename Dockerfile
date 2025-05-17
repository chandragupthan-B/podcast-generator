FROM ubuntu:latest


# Install Python, pip, and required build dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install pyyaml

# Copy your scripts
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint is executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
