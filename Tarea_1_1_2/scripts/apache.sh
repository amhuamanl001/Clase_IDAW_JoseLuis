
#!/bin/bash
# Indica que el script se ejecutará utilizando Bash.

# Actualiza la lista de paquetes disponibles en Debian.
apt-get update

# Instala el servidor web Apache sin pedir confirmación.
apt-get install -y apache2

# Activa Apache para que se inicie automáticamente al arrancar Debian.
systemctl enable apache2

# Inicia Apache para que el servidor web empiece a funcionar.
systemctl start apache2

# Obtiene el nombre actual de la máquina virtual y lo guarda en una variable.
NOMBRE_MAQUINA=$(hostname)

# Crea la página principal de Apache con mi nombre y el hostname.
echo "<h1>Alexander Manuel Huaman Linares</h1><p>Hostname: $NOMBRE_MAQUINA</p>" > /var/www/html/index.html

# NUEVA PRUEBA: añade un mensaje para comprobar el segundo aprovisionamiento.
echo "<p>Segunda prueba de aprovisionamiento con Vagrant</p>" >> /var/www/html/index.html

# Comprueba que Apache está activo.
systemctl status apache2