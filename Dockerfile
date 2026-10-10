FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates python3 python3-numpy && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
COPY . .

RUN bash reproduce_all.sh
