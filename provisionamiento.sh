#!/usr/bin/env bash

set -e

echo ">>> Actualizando paquetes"
apt-get update -y

echo ">>> Instalando Nginx y UFW"
apt-get install -y nginx ufw

echo ">>> Creando estructura del sitio"
mkdir -p /var/www/jose-nico.test/html/static-website-example
chown -R www-data:www-data /var/www/jose-nico.test
chmod -R 755 /var/www/jose-nico.test

echo ">>> Creando configuración de Nginx para jose-nico.test"

cat << 'EOF' > /etc/nginx/sites-available/jose-nico.test
server {
    listen 80;

    server_name jose-nico.test www.jose-nico.test;

    root /var/www/jose-nico.test/html/static-website-example;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

echo ">>> Activando sitio en Nginx"
ln -sf /etc/nginx/sites-available/jose-nico.test /etc/nginx/sites-enabled/jose-nico.test
rm -f /etc/nginx/sites-enabled/default

echo ">>> Configurando firewall UFW"

ufw allow ssh
ufw allow 'Nginx HTTP'
ufw --force enable

echo ">>> Probando configuración"
nginx -t

echo ">>> Recargando Nginx"
systemctl reload nginx

echo ">>> Provisionamiento completado con éxito"
