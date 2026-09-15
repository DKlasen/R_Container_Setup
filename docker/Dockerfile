ARG BUILD_DATE=latest
FROM rocker/r-ver:4.6.1

# Systemabhängigkeiten inklusive Pandoc und Cairo für HTML/Grafik-Rendering installieren
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential \
    pandoc \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Skript und Requirements kopieren
COPY docker/install.R ./
COPY docker/*.txt ./

ARG BUILD_DATE
ENV BUILD_DATE_ENV=$BUILD_DATE

RUN Rscript install.R