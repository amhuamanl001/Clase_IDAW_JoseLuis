# Práctica: Despliegue de Oracle Database 23ai Free, PostgreSQL y MariaDB

## Datos de la practica

- **Nombre y Apellidos:** Alexander Manuel Huaman Linares
- **Grupo:** ASIR 2
- **Título de la tarea:** Instalación de tres SGBD
- **Fecha:** 13/10/2026

---
## Índice

1. [Objetivo](#1-objetivo)
2. [Características de la máquina virtual](#2-Características-de-la-máquina-virtual)
3. [Instalación de Oracle Database 23ai Free](#3-instalación-de-oracle-database-23ai-free-con-Podman)
---

## 1. Objetivo 

Objetivo: desplegar Oracle Database 23ai Free, PostgreSQL y MariaDB en una máquina virtual con Linux Mint o Debian; crear las bases de datos y usuarios indicados, comprobar la conexióny documentar lo realizado.

---
## 2. Características de la máquina virtual

- **Sistema operativo:** Linux Mint
- **RAM:** 4 GB
- **CPU:** 2 CPU
- **Almacenamiento:** 250 GB
---
## instalación de oracle database 23ai free con Podman

### Preparar Podman y descargar la imagen
#### Actualizar Lista interna de los repositorios

Primero tenemos que actualizar la lista de paquetes disponibles en internet. Para ello, ejecutamos:
```bash
sudo apt update
```

#### Instalar Podman

Podman es una herramienta que permite crear y ejecutar contenedores. Para instalarlo ejecutamos:
```bash
sudo apt install podman
```

Puedes verificar si se a instalado correctamente ejecutando este comando:
```bash
podman --version
```
> si el comando devuelve la version de podman, la instalacion esta bien echa.
#### Descargar la imagen de Oracle Database 23ai Free

Para instalar la imagen de **Oracle Database 23ai** desde la pagina de contenedores de oracle, ejecutamos esto:
```bash
sudo podman pull container-registry.oracle.com/database/free:23.5.0.0
```

Si la instalacion a terminado sin errores, podras verificar que se a descargado correctamente con el siguiente comando:
```bash
sudo podman images
```
> si el comando devuelve una tabla con datos de la imagen, significa que esta correctamente descargada.

### Crear y comprobar el contenedor

Ahora vamos a crear un volumen para guardar los datos de oracle de forma persistente y vamos . 

#### Crear el volumen

Para crear el volumen ejecutamos:
```bash
sudo podman volume create oracle_23ai_datos
```

#### Crear y ejecutar el contenedor de Oracle

Para ello, ejecutamos
```bash
sudo podman run -d --name cont-oracle -p 1521:1521 --restart=always -v oracle_23ai_datos:/opt/oracle/oradata:U container-registry.oracle.com/database/free:23.5.0.0
```

- `podman run`: Crea un contenedor nuevo a partir de la imagen y lo inicia.

- `-d`: Hace que el contenedor se ejecute en segundo plano, sin dejar la terminal ocupada.

- `--name cont-oracle`: Asigna al contenedor el nombre `cont-oracle` para poder identificarlo y gestionarlo fácilmente.

- `-p 1521:1521`: Conecta el puerto 1521 de la máquina virtual con el puerto 1521 del contenedor, permitiendo las conexiones a Oracle.

- `--restart=always`: Configura el contenedor para que intente iniciarse automáticamente cuando sea necesario.

- `-v oracle_23ai_datos:/opt/oracle/oradata:U`: Conecta el volumen `oracle_23ai_datos` con la carpeta donde Oracle guarda sus datos, permitiendo conservarlos aunque el contenedor se elimine o se vuelva a crear.

- `container-registry.oracle.com/database/free:23.5.0.0`: Indica la imagen de Oracle Database 23ai Free que Podman utilizará para crear el contenedor.

#### Comprobar el contenedor

Para comprobar que el contenedor de Oracle está funcionando:

```bash
sudo podman ps
```

Para ver todos los contenedores, incluso los detenidos:
```bash
sudo podman ps -a
```

Para revisar el inicio de Oracle y posibles errores:
```bash
sudo podman logs cont-oracle
```

> Los registros permiten comprobar el estado de inicio de Oracle y, según la configuración de la imagen, pueden mostrar la contraseña de administración generada automáticamente.

### Entrar en Oracle y crear el usuario de trabajo

Ahora entraremos en el contenedor de podman y abriremos una terminal interactiva dentro de él. Para ello, ejecutamos:
```bash
sudo podman exec -it cont-oracle /bin/bash
```
> si en la terminal aparece **bash-4.4$**, estas dentro de la terminal en podman.

Para salir de esa terminal simplemente ejecutamos:
```bash
exit
```

Ahora que ya sabemos como abrir una terminal en podmad, la volveremos abrir pero ahora para abrir SQL`*`Plus y conectarnos a la base de datos como administradores.
```bash
sudo podman exec -it cont-oracle sqlplus / as sysdba
```


