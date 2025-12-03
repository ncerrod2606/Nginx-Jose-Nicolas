# Configuración de un servidor web con autenticación básica

<p align="left">
<img src="https://img.shields.io/badge/STATUS-FINALIZADO-blue">
</p>

## Índice

1. [Prerequisitos](#prerequisitos)
2. [Configuración de Nginx](#configuracion-de-nginx)
3. [Nombre de servidor](#nombre-de-servidor)
4. [Configuración del cortafuegos](#configuracion-del-cortafuegos)
5. [Generar un certificado autofirmado](#generar-un-certificado-autofirmado)
6. [Configuración](#configuracion)
7. [Probando la nueva configuración](#probando-la-nueva-configuracion)

---

## Paquetes necesarios

Primero configuraremos el archivo hosts con la linea en cmd:

```
notepad C:\Windows\System32\drivers\etc\hosts
```

Y añadiremos la siguiente linea:

```
192.168.125.16 jose-nico.test www.jose-nico.test
```

![paquetes-necesarios](./img/cp1.png)


## Configuracion de nginx

Ahora para la configuracion de nginx apropiada para el proyecto añadiremos www.jose-nico.test en el archivo de configuracion de nginx.

![configuracion-nginx](./img/cp2.png)

Y debidamente comprobaremos que la configuracion de nginx es correcta, con los comandos:

```
sudo nginx -t
```

Y recargaremos nginx con el comando:

```
sudo systemctl reload nginx
```

![configuracion-nginx](./img/cp3.png)


## Configuracion del cortafuegos

Para configurar el cortafuegos necesitaremos instalar el paquete ufw, para ello ejecutaremos el comando:

```
sudo apt install ufw
```

Y comprobaremos el estado de ufw con el comando:

```
sudo ufw status
```

![configuracion-cortafuegos](./img/cp4.png)

Activaremos el perfil para permitir el tráfico HTTPS con los siguientes comandos:

```
sudo ufw allow ssh
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
```

Y activaremos ufw con el comando:

```
sudo ufw --force enable
```

Quedando el estado de ufw como el siguiente:

![configuracion-cortafuegos](./img/cp5.png)

## Generar un certificado autofirmado


