#!/bin/bash

# start DB
/usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l /app/logfile start

# config DB
psql < /app/db_init.sql

# run script
python /app/hashmap_gen.py $1
