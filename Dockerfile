FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.5 \
    nginx \
    supervisor \
    libmysqlclient-dev \
    python3.5-dev \
    git \
    python-virtualenv \
    libjemalloc1 \
    libjemalloc-dev \
    gcc \
    make \
    libssl-dev \
    libffi-dev \
    libxslt-dev \
    libxml2-dev \
    libpq-dev \
    wget \
    sudo && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    wget http://download.redis.io/redis-stable.tar.gz && \
    tar xvzf redis-stable.tar.gz && \
    cd redis-stable && \
    make && \
    cp src/redis-cli /usr/local/bin/ && \
    cp src/redis-server /usr/local/bin/ && \
    chmod 755 /usr/local/bin/redis-cli  && \
    chmod 755 /usr/local/bin/redis-server && \
    make clean

RUN apt-get update && apt-get install -y curl \
    software-properties-common \
	python-software-properties \
	apt-transport-https && \
    curl -fsSL http://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-cache policy docker-ce && \
    apt-get install -y docker-ce && \
    rm -rf /var/lib/apt/lists/*
