FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    openssl=1.1.1f-1ubuntu2.9 \
    && rm -rf /var/lib/apt/lists/*

RUN openssl version

CMD ["sleep", "infinity"]
