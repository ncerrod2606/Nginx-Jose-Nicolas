#!/bin/bash
set -e

echo ">>> Actualizando paquetes"
apt-get update -y

echo ">>> Instalando Nginx y UFW"
apt-get install -y nginx ufw openssl

echo ">>> Creando estructura del sitio"
mkdir -p /var/www/jose-nico.test/html/static-website-example
chown -R www-data:www-data /var/www/jose-nico.test

echo ">>> Generando certificado SSL autofirmado"
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/ssl/private/jose-nico.test.key \
  -out /etc/ssl/certs/jose-nico.test.crt \
  -subj "/C=ES/ST=Andalucia/L=Granada/O=IZV/OU=WEB/CN=jose-nico.test"

echo ">>> Creando configuración de Nginx para jose-nico.test"

cat << 'EOF' > /etc/nginx/sites-available/jose-nico.test
server {
    listen 80;
    listen 443 ssl;

    server_name jose-nico.test www.jose-nico.test;

    root /var/www/jose-nico.test/html/static-website-example;
    index index.html;

    ssl_certificate /etc/ssl/certs/jose-nico.test.crt;
    ssl_certificate_key /etc/ssl/private/jose-nico.test.key;

    ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

echo ">>> Activando sitio en Nginx"
ln -sf /etc/nginx/sites-available/jose-nico.test /etc/nginx/sites-enabled/jose-nico.test

echo ">>> Configurando firewall UFW"

ufw allow ssh
ufw allow 'Nginx Full'
ufw delete allow 'Nginx HTTP' || true
ufw --force enable

echo ">>> Probando configuración"
nginx -t

echo ">>> Recargando Nginx"
systemctl reload nginx

echo ">>> Provisionamiento completado con éxito"
