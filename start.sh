#!/bin/bash

apt update && apt upgrade -y && \
	apt install -y python3 python3-venv python3-pip mysql-server apt-transport-https gnupg2 curl

echo "deb http://nginx.org/packages/ubuntu/ jammy nginx" > /etc/apt/sources.list.d/nginx.list
curl -s https://nginx.org/keys/nginx_signing.key | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/trusted.gpg --import
chmod 644 /etc/apt/trusted.gpg.d/trusted.gpg
apt update

apt install nginx

rm -f /etc/machine-id
/bin/systemd-machine-id-setup

./4-filtering-node-deploy.sh 'nwaf_lic_key=none' 'api_url=%Nemesida WAF API URL%'

cp ./nginx.conf /etc/nginx/nginx.conf

export MYSQL_ROOT_PASSWORD=root_password
export MYSQL_DATABASE=test_db

# export VIRTUAL_ENV=/home/korimedg/server/myenv
# export PATH="$VIRUAL_ENV/bin:$PATH"

service mysql start &
service nginx start &
sleep 5 &&
mysql -u root -p$MYSQL_ROOT_PASSWORD < ./db.sql
python3 -m venv myenv
source myenv/bin/activate
pip install Flask mysql-connector-python
python3 main.py

