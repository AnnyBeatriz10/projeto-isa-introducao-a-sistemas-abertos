#!/bin/bash

#agendar no terminal crontab -e

sudo mkdir -p /var/backups/ifrn/$(date "+%Y")/$(date "+%m")
sudo tar -czf /var/backups/ifrn/$(date "+%Y")/$(date "+%m")/backup-$(date "+%Y%m%d").tar.gz /home/Documentos
echo "copiando o arquivo..."
scp /var/backups/ifrn/$(date "+%Y")/$(date "+%m")/backup-$(date "+%Y%m%d").tar.gz root@10.20.2.0:/var/backups


