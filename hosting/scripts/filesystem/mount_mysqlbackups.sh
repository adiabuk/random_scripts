#!/bin/bash

# mount mysqldump dir

mount --bind /var/backups/amrox/mysqlbackups /var/lib/vz/root/$1/var/backups/mysqlbackups|| mount --bind /var/backups/mysqlbackups /vz/root/$1/var/backups/mysqlbackups
