#!/bin/bash

apt update && apt upgrade -y && \
	apt install -y python3 python3-venv python3-pip mysql-server apt-transport-https gnupg2 curl net-tools

echo "deb http://nginx.org/packages/ubuntu/ jammy nginx" > /etc/apt/sources.list.d/nginx.list
curl -s https://nginx.org/keys/nginx_signing.key | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/trusted.gpg --import
chmod 644 /etc/apt/trusted.gpg.d/trusted.gpg
apt update

apt install nginx

rm -f /etc/machine-id
/bin/systemd-machine-id-setup

./4-filtering-node-deploy.sh 'nwaf_lic_key=none' 'api_url=localhost' #%Nemesida WAF API URL%'

cp ./nginx.conf /etc/nginx/nginx.conf
cp ./nwaf.conf /etc/nginx/nwaf/conf/global/


