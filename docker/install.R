snapshot_date <- Sys.getenv("BUILD_DATE_ENV", "2026-09-10")

# Repository-URL für das Datum setzen
options(repos = c(CRAN = sprintf("https://packagemanager.posit.co/cran/%s", snapshot_date)))

# pak installieren, falls noch nicht vorhanden
if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

# P3M-Datum für pak erzwingen
Sys.setenv(R_PKG_PPM_DATE = snapshot_date)

# Automatische Suche nach einer Requirements-Datei via Wildcard
req_files <- list.files(path = ".", pattern = "^requirements.*\\.txt$", full.names = TRUE)

if (length(req_files) > 0) {
  req_file <- req_files[1]
  cat("Verwende Requirements-Datei:", req_file, "\n")
  
  # Pakete auslesen und bereinigen
  pkgs <- readLines(req_file)
  pkgs <- trimws(pkgs)
  pkgs <- pkgs[nzchar(pkgs) & !startsWith(pkgs, "#")]
  
  # Prüfen, welche Pakete bereits installiert sind
  installed_pkgs <- rownames(installed.packages())
  missing_pkgs <- pkgs[!(pkgs %in% installed_pkgs)]
  
  if (length(missing_pkgs) > 0) {
    cat("Folgende Pakete sind noch nicht installiert und werden hinzugefügt:\n")
    print(missing_pkgs)
    pak::pkg_install(missing_pkgs)
  } else {
    cat("Alle Pakete aus der requirements-Datei sind bereits im System vorhanden.\n")
  }
  
} else {
  stop("Keine passende requirements*.txt Datei gefunden!")
}