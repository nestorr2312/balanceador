#!/bin/bash
source .env

# Ejemplo: Descargar aplicación de GitHub
cd /var/www/html
rm -rf *
# Supongamos que clonamos un repo
# git clone https://github.com/usuario/repo.git .

# Ajustar permisos
chown -R www-data:www-data /var/www/html

echo "Despliegue finalizado."
