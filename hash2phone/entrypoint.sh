#!/bin/bash

# start our web server
apachectl -D FOREGROUND &

# start DB
sudo -u postgres /usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l /app/logfile start

# config DB
sudo -u postgres psql < /app/db_init.sql

# run script
python /app/hashmap_gen.py $1
