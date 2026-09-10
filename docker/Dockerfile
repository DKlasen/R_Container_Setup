FROM rocker/r-ver:4.4.0

# Build-Argument für das gewünschte Datum definieren (z. B. 2026-06-01 oder 'latest')
ARG BUILD_DATE=latest

# System-Abhängigkeiten aktualisieren und benötigte Bibliotheken installieren
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
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
    git \
    && rm -rf /var/lib/apt/lists/*

# Dynamisches Repository je nach Datum setzen:
# Wenn BUILD_DATE auf 'latest' steht, wird der Standard-CRAN-Mirror genutzt, 
# ansonsten der P3M-Snapshot für das spezifische Datum.
RUN if [ "$BUILD_DATE" = "latest" ]; then \
        REPO="https://cloud.r-project.org"; \
    else \
        REPO="https://packagemanager.posit.co/cran/$BUILD_DATE"; \
    fi && \
    echo "Using R repository: $REPO" && \
    R -e "install.packages('BiocManager', repos='$REPO')" && \
    R -e "BiocManager::install(update = FALSE, ask = FALSE, site_repository='$REPO')" && \
    R -e "BiocManager::install(c('tidyverse', 'rstatix', 'data.table', 'patchwork', 'ggplot2', 'rmarkdown', 'knitr', 'stringr', 'wrappedtools','ggbeeswarm','GGally','flextable'), update = FALSE, repos='$REPO')"

# Kopiert die datumsabhängige requirements-Datei (z. B. requirements-2026-06-01.txt)
COPY docker/requirements-${BUILD_DATE}.txt /tmp/requirements.txt

# Installiert zusätzliche Pakete aus der requirements.txt über das zeitpunktgenaue Repository
RUN if [ -s /tmp/requirements.txt ]; then \
        if [ "$BUILD_DATE" = "latest" ]; then \
            REPO="https://cloud.r-project.org"; \
        else \
            REPO="https://packagemanager.posit.co/cran/$BUILD_DATE"; \
        fi && \
        R -e "packages <- readLines('/tmp/requirements.txt'); \
              packages <- trimws(packages); \
              packages <- packages[packages != '' & !grepl('^#', packages)]; \
              BiocManager::install(packages, update = FALSE, ask = FALSE, repos='$REPO')"; \
    fi