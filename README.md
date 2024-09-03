# BackupScript

## Übersicht
Dieses PowerShell-Skript dient dazu, regelmäßig Backups eines angegebenen Verzeichnisses zu erstellen und in einem definierten Backup-Ordner zu speichern. Das Skript überprüft, ob bereits ein Backup existiert und ob seit dem letzten Backup Änderungen an den Dateien vorgenommen wurden. Falls Änderungen festgestellt werden, wird ein neues Backup erstellt. Das Backup wird als ZIP-Datei gespeichert, wobei der Dateiname das aktuelle Datum enthält.

## Anwendung
### 1. Quell- und Zielverzeichnis definieren
Im Skript müssen der Pfad des Verzeichnisses, das gesichert werden soll (`$sourcePath`), und der Pfad des Verzeichnisses, in dem das Backup gespeichert werden soll (`$backupPath`), angegeben werden.

### 2. Skript ausführen
Das Skript wird ausgeführt und überprüft zunächst, ob bereits ein Backup im Zielverzeichnis existiert:

- **Kein Backup vorhanden**: Es wird ein neues Backup des gesamten Verzeichnisses erstellt.
- **Backup vorhanden**: Das Skript prüft, ob es seit dem letzten Backup Änderungen an den Dateien gab. Wenn Änderungen festgestellt werden, wird ein neues Backup erstellt.

### 3. Sicherung und Komprimierung
Das Backup wird als ZIP-Datei im Zielverzeichnis gespeichert. Der Dateiname enthält das aktuelle Datum im Format `yyyyMMdd`.

## Wieso wird das Skript gebraucht?

Dieses Skript automatisiert den Backup-Prozess, indem es regelmäßig eine Sicherung der wichtigen Dateien durchführt und nur dann ein neues Backup erstellt, wenn Änderungen vorgenommen wurden. Dadurch werden unnötige Backups vermieden, und es wird sichergestellt, dass immer eine aktuelle Sicherung der Daten vorhanden ist.

## Was macht das Skript?

- **Überprüfung auf bestehendes Backup**: Es wird geprüft, ob im Backup-Ordner bereits ein Backup existiert.
- **Änderungserkennung**: Das Skript erkennt, ob seit dem letzten Backup Änderungen an den Dateien vorgenommen wurden.
- **Backup-Erstellung**: Ein neues Backup wird erstellt und im Backup-Ordner als ZIP-Datei gespeichert.
