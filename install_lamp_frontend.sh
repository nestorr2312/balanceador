#!/bin/bash
apt update
apt install apache2 php libapache2-mod-php php-mysql -y

# Reiniciar para aplicar cambios
systemctl restart apache2  
