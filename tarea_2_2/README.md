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

Primero tenemos que actulizar la lista de paquetes disponibles en internet:[][]
```bash
sudo apt update
```

#### Instalar Podman

Podman es una herramienta que permite crear y ejecutar contenedores.
Para instalarlo tenemos que ejecutar el siguiente comando:[][]
```bash
sudo apt install podman
```

Puedes verificar si se a instalado correctamente ejecutando este comando:[][]
```bash
podman --version
```
> si el comando devuelve la version de podman, la instalacion esta bien echa.
#### Descargar la imagen de Oracle Database 23ai Free

Para instalar la imagen de **Oracle Database 23ai** desde la pagina de contenedores de oracle, ejecuta este comando:[][]
```bash
sudo podman pull container-registry.oracle.com/database/free:23.5.0.0
```

Si la instalacion a terminado sin errores, podras verificar que se a descargado correctamente con el siguiente comando:[][]
```bash
sudo podman images
```
> si el comando devuelve una tabla con datos de la imagen, significa que esta correctamente descargada.




