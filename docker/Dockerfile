FROM rocker/r-ver:4.4.0

ARG BUILD_DATE=2024-09-10

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libcairo2-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libgl1 \
    libglib2.0-0 \
    libhdf5-dev \
    libwebp-dev \
    libglpk40 \
    git \
    && rm -rf /var/lib/apt/lists/*

# 1. Standard-CRAN-Pakete installieren
RUN if [ "$BUILD_DATE" = "latest" ]; then \
        REPO="https://packagemanager.posit.co/cran/__linux__/jammy/latest"; \
    else \
        REPO="https://packagemanager.posit.co/cran/__linux__/jammy/$BUILD_DATE"; \
    fi && \
    echo "Using R repository: $REPO" && \
    R -e "pkgs <- c('tidyverse', 'rstatix', 'data.table', 'patchwork', 'ggplot2', 'rmarkdown', 'knitr', 'stringr', 'ggbeeswarm', 'GGally', 'flextable', 'remotes'); install.packages(pkgs, repos='$REPO')"

# 2. 'wrappedtools' von GitHub installieren
RUN R -e "remotes::install_github('abusjahn/wrappedtools')"

COPY docker/requirements-${BUILD_DATE}.txt /tmp/requirements.txt

# 3. Zusätzliche Pakete (wie Seurat) aus der requirements.txt installieren
RUN if [ -s /tmp/requirements.txt ]; then \
        if [ "$BUILD_DATE" = "latest" ]; then \
            REPO="https://packagemanager.posit.co/cran/__linux__/jammy/latest"; \
        else \
            REPO="https://packagemanager.posit.co/cran/__linux__/jammy/$BUILD_DATE"; \
        fi && \
        R -e "packages <- readLines('/tmp/requirements.txt'); \
              packages <- trimws(packages); \
              packages <- packages[packages != '' & !grepl('^#', packages)]; \
              install.packages(packages, repos='$REPO')"; \
    fi