#!/bin/bash
source .env

# Actualizar repositorios e instalar Apache
apt update && apt install apache2 -y

# Habilitar módulos necesarios para el balanceo
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_balancer
a2enmod lbmethod_by_requests

# Configurar el VirtualHost como balanceador (ejemplo con 2 frontends)
cat <<EOF > /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
    <Proxy balancer://mycluster>
        # Reemplazar con IPs reales de tus frontends
        BalancerMember http://3.92.37.90
        BalancerMember http://98.94.187.190
    </Proxy>

    ProxyPass / balancer://mycluster/
    ProxyPassReverse / balancer://mycluster/
</VirtualHost>
EOF

systemctl restart apache2
