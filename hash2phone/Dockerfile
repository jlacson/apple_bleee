FROM ubuntu:18.04
MAINTAINER jml0@vt.edu

# don't bother us
ARG DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN  apt update && \
     apt -y install postgresql                \
                    apache2                   \ 
                    apache2-utils             \
                    php                       \
                    php-pgsql                 \
                    libapache2-mod-php        \
                    libpq5                    \
                    postgresql-client         \
                    postgresql-client-common  \
                    postgresql-contrib        \
                    python                    \
                    python-pip                \
                    postgresql-server-dev-all \
                    sudo

RUN  pip install psycopg2

# copy files into the container
COPY db_init.sql /app/
COPY hashmap_gen.py /app/
COPY entrypoint.sh /app/
COPY map_hash_num.php /var/www/html/

# copy default config file so postgres inits
RUN  cp /etc/postgresql/10/main/*.conf /var/lib/postgresql/10/main/ && \
        mkdir /var/lib/postgresql/10/main/conf.d/

# make sure permissions are set
RUN  chown -R postgres:postgres /var/lib/postgresql && \
     chown -R postgres:postgres /app

# use entrypoint here
ENTRYPOINT ["/app/entrypoint.sh"]
CMD []
