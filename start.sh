#!/bin/bash

export MYSQL_ROOT_PASSWORD=root_password
export MYSQL_DATABASE=test_db

# export VIRTUAL_ENV=/home/korimedg/server/myenv
# export PATH="$VIRUAL_ENV/bin:$PATH"

service mysql restart &
service nginx rabbitmg-server memcached nwaf_updater restart &
sleep 5 &&
mysql -u root -p$MYSQL_ROOT_PASSWORD < ./db.sql
python3 -m venv myenv
source myenv/bin/activate
pip install Flask mysql-connector-python
python3 main.py

