# based on Debian, should work
FROM postgres:10
MAINTAINER jml0@vt.edu

# don't bother us when installing packages
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
COPY map_hash_num.php /var/www/html/

# start postgres
RUN  service postgresql start

# prepare our database
RUN  sudo -u postgres psql < /app/db_init.sql

# use entrypoint here
ENTRYPOINT ['python', '/app/hashmap_gen.py']
