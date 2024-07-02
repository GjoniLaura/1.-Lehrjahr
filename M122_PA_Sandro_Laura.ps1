# Welches Verzeichnis soll gesichert werden

$sourcePath = "C:\Users\laura\OneDrive - sluz\Dokumente\BBZW Sursee\M122\Partnerarbeit"


# In welchem Verzeichnis soll das Backup gespeichert werden

$backupPath = "C:\Users\laura\OneDrive - sluz\Dokumente\BBZW Sursee\M122\Partnerarbeit\Backup"


# Backup Name

$backupName = "$(Get-Date -Format 'yyyyMMdd').zip"


# Gibt es schon ein Backup

$lastBackup = Get-ChildItem -Path $backupPath



if ($lastBackup.Count -eq 0) 
{

    Write-Host "Es wurde kein vorheriges Backup gefunden. Ein Backup wird erstellt."

    Compress-Archive -Path $sourcePath -DestinationPath "$backupPath\$backupName"

} 

else 
{

    # Vergleichen des Zeitstempel des letzten Backup mit den Dateien im Verzeichnis

    $lastBackupTime = $lastBackup.LastWriteTime

    $changedFiles = Get-ChildItem -Path $sourcePath -Recurse | Where-Object { $_.LastWriteTime -gt $lastBackupTime }


    if ($changedFiles.Count -gt 0) 
    {

        Write-Host "Es wurden Änderungen seit dem letzten Backup gefunden. Ein neues Backup wird erstellt."

        $changedFiles | Compress-Archive -DestinationPath "$backupPath\$backupName"

    } 
    
    else 
    {
        Write-Host "Es wurden keine Änderungen seit dem letzten Backup gefunden. Es wird kein neues Backup erstellt."
    }

}

<# 
Vorgang: 
Zuerst wird der Pfad des Verzeichnisses & des Backupverzeichnisses 
im Script angegeben. Das Script wird anschliessend durchgeführt und das Backup wird
mit dem Zeitstempel als Zip-File im Backupverzeichnis gespeichert.

Erwartung: 
Es wird erwartet das, das Powershellscript ein Backup in einem Backupordner, 
welcher im angegebenen Verzeichnis vorhanden ist, 
erstellt und neue/geänderte Files absucht. Das Backup wird
anschliessend mit dem aktuellen Zeitstempel in einen Zip-Ordner komprimiert.

Befund:
Das erstellte Script funktioniert einwandfrei und das Backup wird fehlerfrei erstellt.
#>