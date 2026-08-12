FROM nextcloud:latest

RUN apt-get update && \
    apt-get install -y \
        unzip \
        libzip-dev \
        php8.4-apcu && \
    docker-php-ext-enable apcu && \
    rm -rf /var/lib/apt/lists/*
