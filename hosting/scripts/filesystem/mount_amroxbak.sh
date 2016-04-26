#!/bin/bash

# mount backups dir

mount --bind /var/backups/amrox /var/lib/vz/root/$1/var/backups/amrox|| mount --bind /var/backups/amrox /vz/root/$1/var/backups/amrox

