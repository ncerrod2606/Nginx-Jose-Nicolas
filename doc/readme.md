# Configuración de un servidor FTP
<p align="left">
<img src="https://img.shields.io/badge/STATUS-FINALIZADO-blue">
</p>

## Índice
1. [Creación de la máquina virtual ](#creacion-de-la-maquina-virtual)
2. [Instalacion de Nginx](#instalacion-de-nginx)
3. [Clonación del repositorio para la web](#clonacion-del-repositorio-para-la-web)
4. [Configuracion del archivo jose-nico.test](#configuracion-del-archivo-jose-nico-test)
5. [Configuracion del archivo /etc/hosts](#configuracion-del-archivo-etc-hosts)
6. [Comprobacion de la configuracion de Nginx por nuestra IP](#comprobacion-de-la-configuracion-de-nginx-por-nuestra-ip)
7. [Comprobacion de la configuracion de Nginx por nuestro dominio](#comprobacion-de-la-configuracion-de-nginx-por-nuestro-dominio)
8. [Visualizacion de los accesos a Nginx](#visualizacion-de-los-accesos-a-nginx)
9. [Visualizacion de errores de Nginx](#visualizacion-de-errores-de-nginx)

---

## Creacion de la maquina virtual 

Creamos la máquina virtual con nuestra IP de máquina virtual 192.168.125.16 una vez realizado esto haremos un **vagrant up** para iniciar la máquina virtual y una vez iniciada la máquina virtual haremos un **vagrant ssh** para conectarnos a la máquina virtual

![creacion-maquina](./img/cp1.png)

## Instalacion de Nginx

Instalamos Nginx y una vez instalado comprobamos su estado con el comando
```
systemctl status nginx
```

![instalacion-nginx](./img/cp2.png)

## Clonación del repositorio para la web

Nos movemos a la carpeta /var/www/jose-nico.test/html y posterior a esto clonamos el repositorio para la web con el comando
```
git clone https://github.com/cloudacademy/static-website-example
```

Donde el repositorio se clonara en la carpeta **/var/www/jose-nico.test/html**

![clonacion-repositorio](./img/cp3.png)

## Configuracion del archivo jose-nico.test

Configuramos el archivo jose-nico.test en la carpeta /etc/nginx/sites-available

![configuracion-archivo](./img/cp4.png)

## Configuracion del archivo /etc/hosts

Configuramos el archivo /etc/hosts en nuestra máquina principal para la web jose-nico.test con la IP de la máquina virtual 192.168.125.16 

![configuracion-archivo-hosts](./img/cp5.png)

## Comprobacion de la configuracion de Nginx por nuestra IP

Comprobamos la configuracion de Nginx por nuestra IP poniendo en nuestra URL la IP de la máquina virtual 192.168.125.16

![comprobacion-configuracion](./img/cp6.png)

## Comprobacion de la configuracion de Nginx por nuestro dominio

Comprobamos la configuracion de Nginx por nuestro dominio poniendo en nuestra URL el dominio jose-nico.test

![comprobacion-configuracion-dom](./img/cp7.png)


## Visualización de los accesos a Nginx

Visualizamos los accesos a Nginx con el comando
```
cat /var/log/nginx/access.log
```

![visualizacion-accesos](./img/cp8.png)


## Visualización de errores de Nginx

Visualizamos los errores de Nginx con el comando
```
cat /var/log/nginx/error.log
```

![visualizacion-errores](./img/cp9.png)










