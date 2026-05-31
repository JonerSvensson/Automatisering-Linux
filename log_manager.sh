#!/bin/bash

# Kontrollera och eller skapa logs_backup

if [ ! -d "logs_backup" ]; then
    mkdir logs_backup
    echo "Skapat mappen logs_backup"
else
    echo "Mappen logs_backup finns redan"
fi

# Ta bort gamla loggfiler
echo "Tar bort gamla loggfiler"
rm *.log

# Skapa 5 loggfiler
echo "Skapar 5 loggfiler"
for i in {1..5}; do
    DATE=$(date +%Y-%m-%d_%H-%M-%S)
    echo "Loggfil $i skapad" > "logfile_${i}_${DATE}.log"
    echo "Skapade logfile_${i}_${DATE}.log"
done

# Kopiera till logs_backup
echo "Kopierar filerna till logs_backup"
cp *.log logs_backup/

# Avslut
echo ""
echo "Klart"
echo "Filer i logs_backup"
ls -lh logs_backup/