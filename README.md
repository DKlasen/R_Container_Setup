README
Dies ist ein Standart R Container. Im Unterordner docker befindet sich der Docker File. Diese Ordner soll mittels Copy und Paste 
schnell eine reproduzierbare R umgebung erzeugen.
WICHTIG bei neuen Projekt muss im Docker File BUILD_DATE nutzt das aktuellen Datum (laterst). 
Dieses muss bei einem neuen Projekt entsprechend dem derzeitigen Datum angepasst werden YYYY-MM-DD
Wichtig nur die Packet in requiremnt.txt können per Version festgelegt werden.
Von den Default Packeten 'tidyverse', 'rstatix', 'data.table', 'patchwork', 'ggplot2', 'rmarkdown', 'knitr', 'stringr', 'wrappedtools','ggbeeswarm','GGally','flextable' werden die aktuellesten Versionen geladen. 
Damit kann auch in Zukunft eine Kompatibilität gewährleistet werden.
Weiterhin sollte der Container einen spezifischen Namen erhalten dies geschieht .devcontainer/devcontainer.json
In Test befindet sich der iris.csv Datensatz sowie ein Script, welches zum testen der default Packete pandas numpy matplotlib ipykernel dient.
Die Basis Struktur ist Data für sämtliche Input Daten. Output für Plots und Ergebnis Tabellen. Skripts für gespeicherte Skripte.
Wichtig für die Versionkontrolle werden lediglich die Skripte und der Test Ordner gepushed.

English Version
This is a standard R container. The Dockerfile is located in the ‘docker’ subfolder. This folder is designed to allow you to quickly create a reproducible R environment
by copying and pasting.
IMPORTANT: for new projects, the `BUILD_DATE` in the Dockerfile must use the current date (latest).
This must be updated to reflect the current date (YYYY-MM-DD) for a new project.
Please note that only the packages listed in `requirements.txt` can be specified by version.
The latest versions of the default packages ‘tidyverse’, ‘rstatix’, ‘data.table’, ‘patchwork’, ‘ggplot2’, ‘rmarkdown’, ‘knitr’, ‘stringr’, ‘wrappedtools’, ‘ggbeeswarm’, ‘GGally’ and ‘flextable’ are loaded.
This ensures compatibility in the future.
Furthermore, the container should be given a specific name; this is done in .devcontainer/devcontainer.json
The ‘test’ folder contains the ‘iris.csv’ dataset and a script used to test the default packages pandas, numpy, matplotlib and ipykernel.
The basic structure is: ‘Data’ for all input data; ‘Output’ for plots and results tables; and ‘Scripts’ for saved scripts.
For version control purposes, only the scripts and the ‘Test’ folder are pushed.