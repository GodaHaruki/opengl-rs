FROM rust:slim-bullseye

RUN apt update && apt install -y git