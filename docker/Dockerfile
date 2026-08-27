FROM rocker/r-ver:4.4.0

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

# Bioconductor und Standard-Pakete PLUS rmarkdown und knitr installieren
RUN R -e "install.packages('BiocManager', repos='https://cloud.r-project.org')" && \
    R -e "BiocManager::install(update = FALSE, ask = FALSE)" && \
    R -e "BiocManager::install(c('tidyverse', 'rstatix', 'data.table', 'patchwork', 'ggplot2', 'rmarkdown', 'knitr', 'stringr', 'wrappedtools','ggbeeswarm','GGally','flextable'), update = FALSE)"

# Kopiert die requirements.txt aus dem Unterordner in den Container
COPY docker/requirements.txt /tmp/requirements.txt

# Installiert zusätzliche Pakete aus der requirements.txt über BiocManager
RUN if [ -s /tmp/requirements.txt ]; then \
        R -e "packages <- readLines('/tmp/requirements.txt'); \
              packages <- trimws(packages); \
              packages <- packages[packages != '' & !grepl('^#', packages)]; \
              BiocManager::install(packages, update = FALSE, ask = FALSE)"; \
    fi