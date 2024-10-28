FROM rust:slim-bookworm

RUN apt-get update && \
    apt-get install -y x11-apps \
    mesa-utils \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*