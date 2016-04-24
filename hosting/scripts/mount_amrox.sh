#!/bin/bash

# mount configs dir

mount --bind /var/amrox /var/lib/vz/root/$1/var/amrox|| mount --bind /var/amrox /vz/root/$1/var/amrox
