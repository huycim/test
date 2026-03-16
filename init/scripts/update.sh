
#chuyển đến thư mục chứa dự án
# vào portainer -> container -> xem Host/volume của 1 container thuộc dự án sẽ thấy đường dẫn của dự án.
# ví dụ: /data/compose/11

#!/bin/sh

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$BASE_DIR"

docker stop nocobase
docker stop nocobase-carbone	
docker stop nocobase-db
docker stop nocobase-n8n
docker stop nocobase-n8n-db	
docker stop nocobase-vietqr-api

curl http://192.168.6.68/test/nocobase.zip -o nocobase.zip

rm -rf  .license/*
rm -rf  apps/*
rm -rf  config/*
rm -rf  fix/*
rm -rf n8ndata/*
rm -rf n8ndb/*


rm -rf nocobase_data/*
rm -rf nocobase_packages
rm -rf nocobase_plugin/*
rm -rf nocobasedb/*
rm -rf uploads/*

sudo unzip nocobase.zip -d .

sudo chown -R 1000:1000 .license
sudo chown -R 1000:1000 apps
sudo chown -R 1000:1000 config
sudo chown -R 1000:1000 fix
sudo chown -R 1000:1000 n8ndata
sudo chown -R 999:999 n8ndb

sudo chown -R 1000:1000 nocobase_data
sudo chown -R 1000:1000 nocobase_packages
sudo chown -R 1000:1000 nocobase_plugin
sudo chown -R 999:999 nocobasedb

sudo chown -R 1000:1000 uploads
sudo chown -R 999:999 uploads
sudo chown -R 775 uploads

docker start nocobase-vietqr-api
docker start nocobase-n8n-db
docker start nocobase-carbone	
docker start nocobase-db
docker start nocobase-n8n
docker start nocobase





