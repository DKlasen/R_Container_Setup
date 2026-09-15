R Docker & Devcontainer Environment
🇩🇪 Deutsche Version | 🇬🇧 English Version

🇩🇪 Deutsche Version
Dies ist eine standardisierte und reproduzierbare R- und Bioconductor-Umgebung auf Basis von Docker und VS Code Devcontainers.

📁 Ordnerstruktur
Das Projekt verwendet folgende Standardstruktur:

.devcontainer/ – Enthält die devcontainer.json (inkl. spezifischem Containernamen).

docker/ – Enthält das Dockerfile, das Installationsskript sowie die requirements.txt.

Data/ – Ablageort für sämtliche Input-Daten (wird nicht versioniert).

Output/ – Ablageort für exportierte Plots und Ergebnistabellen (wird nicht versioniert).

Scripts/ – Ordner für Ihre Analyserskripte (wird in Git gepusht).

Test/ – Enthält den Beispieldatensatz iris.csv und ein Testskript zur Überprüfung der Standardpakete (wird in Git gepusht).

Wichtiger Hinweis zur Versionskontrolle (Git): Es werden lediglich der Scripts/- und der Test/-Ordner (sowie die Konfigurationen) gepusht. Data/ und Output/ sind von der Versionskontrolle ausgeschlossen.

🚀 Schnellstart & Setup für ein neues Projekt
Ordner kopieren: Kopieren Sie den docker/- und .devcontainer/-Ordner in Ihr neues Projektverzeichnis.

BUILD_DATE anpassen:

Öffnen Sie das Dockerfile im docker/-Ordner.

Passen Sie das BUILD_DATE oben im Dockerfile auf das aktuelle Tagesdatum im Format YYYY-MM-DD an (oder belassen Sie es auf latest, um immer die allerneuesten Paketversionen zu ziehen).

Devcontainer öffnen:

Öffnen Sie das Projekt in VS Code.

Drücken Sie F1 (oder Ctrl+Shift+P / Cmd+Shift+P), wählen Sie Dev Containers: Rebuild Container und warten Sie, bis die Umgebung aufgebaut ist.

📦 Paket-Management & Kompatibilität
Default-Pakete (Aktuellste Version):
Folgende Kernpakete werden bei jedem Build in ihren jeweils neuesten Versionen geladen, um langfristige Kompatibilität zu gewährleisten:
tidyverse, rstatix, data.table, patchwork, ggplot2, rmarkdown, knitr, stringr, wrappedtools, ggbeeswarm, GGally, flextable.

Projekt-spezifische Pakete (Fixierte Versionen):
Weitere oder exakt versionierte Pakete (z. B. für Bioconductor wie DESeq2) tragen Sie einfach in die requirements-<DATUM>.txt im docker/-Ordner ein. Nur diese Pakete werden über das feste BUILD_DATE eingefroren.

🇬🇧 English Version
This is a standardized and reproducible R and Bioconductor environment built on Docker and VS Code Devcontainers.

📁 Folder Structure
The project follows this standard directory layout:

.devcontainer/ – Contains devcontainer.json (including a specific container name).

docker/ – Contains the Dockerfile, the installation script, and requirements.txt.

Data/ – Storage for all input data (excluded from version control).

Output/ – Storage for generated plots and result tables (excluded from version control).

Scripts/ – Directory for your analysis scripts (tracked in Git).

Test/ – Contains the iris.csv dataset and a test script to verify the default packages (tracked in Git).

Important Git Note: Only the Scripts/ and Test/ folders (along with configuration files) are pushed to version control. Data/ and Output/ are ignored.

🚀 Quick Start & Setup for a New Project
Copy Folders: Copy the docker/ and .devcontainer/ folders into your new project directory.

Update BUILD_DATE:

Open the Dockerfile inside the docker/ folder.

Update the BUILD_DATE at the top of the file to the current date in YYYY-MM-DD format (or set it to latest to fetch the absolute newest versions).

Launch Devcontainer:

Open the project folder in VS Code.

Press F1 (or Ctrl+Shift+P / Cmd+Shift+P), select Dev Containers: Rebuild Container, and let the environment build.

📦 Package Management & Compatibility
Default Packages (Latest Versions):
The following core packages are automatically pulled in their newest available versions during the build to ensure future-proofing and compatibility:
tidyverse, rstatix, data.table, patchwork, ggplot2, rmarkdown, knitr, stringr, wrappedtools, ggbeeswarm, GGally, flextable.

Project-Specific Packages (Pinned Versions):
Additional or strictly versioned packages (e.g., Bioconductor packages like DESeq2) should be added to the requirements-<DATE>.txt file in the docker/ folder. Only these packages will be frozen to the specified BUILD_DATE.
