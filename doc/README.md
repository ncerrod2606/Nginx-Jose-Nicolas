# Configuración de un servidor FTP
<p align="left">
<img src="https://img.shields.io/badge/STATUS-FINALIZADO-blue">
</p>

## Índice

1. [Paquetes necesarios](#paquetes-necesarios)
2. [Creación de usuarios y contraseñas para el acceso web](#creacion-de-usuarios-y-contraseñas-para-el-acceso-web)
3. [Configurando el servidor Nginx para usar autenticación básica](#configurando-el-servidor-nginx-para-usar-autenticacion-básica)
4. [Probando la nueva configuración](#probando-la-nueva-configuración)
5. [Tareas](#tareas)
6. [T.1](#t1)
7. [T.2](#t2)
8. [Combinación de autenticación básica y restricción por IP](#combinación-de-la-autenticación-básica-con-la-restricción-de-acceso-por-ip)
9. [Tarea 1](#tarea-1)
10. [Tarea 2](#tarea-2)


---

## Paquetes necesarios 

Instalamos los paquetes necesarios con el comando
```
dpkg -l | grep openssl
```

![paquetes-necesarios](./img/cp1.png)

Si no lo tuvieramos instalado, lo instalamos con el comando
```
sudo apt install openssl -y
```

## Creacion de usuarios y contraseñas para el acceso web

Crearemos un archivo oculto llamado .htpasswd en el directorio de configuración /etc/nginx donde
guardar nuestros dos usuarios y contraseñas en mi caso:

```
sudo sh -c "echo -n 'nicolas:' >> /etc/nginx/.htpasswd"
sudo sh -c "echo -n 'cervera:' >> /etc/nginx/.htpasswd"
```

![creacion-usuarios](./img/cp2.png)

Ahora crearemos un pasword cifrado para el usuario de forma interactiva que es el utilizado por mi caso:
```
sudo sh -c "openssl passwd -apr1 >> /etc/nginx/.htpasswd"
```
o de forma no interactiva:

```
sudo sh -c "openssl passwd -apr1 'aqui_iria_la_contraseña'>> /etc/nginx/.htpasswd"
```

Para comprobar que el usuario y la contraseña aparecen cifrados en el fichero:

```
cat /etc/nginx/.htpasswd
```

![creacion-usuarios-comprobacion](./img/cp3.png)

## Configurando el servidor Nginx para usar autenticacion básica

Accederemos al archivo de nuestra configuración de nginx con el comando:
```
sudo nano /etc/nginx/sites-available/jose-nico.test
```
donde realizaremos la configuración de autenticación básica.

![configuracion-autenticacion](./img/cp4.png)

Ahora reiniciaremos el servidor nginx con el comando:
```
sudo systemctl restart nginx
```
![reiniciar-nginx](./img/cp5.png)

Y la comprobacion de la autenticación básica nos iriamos a la url http://jose-nico.test y se pediria la autenticacion:

![comprobacion-autenticacion](./img/cp6.png)

donde introducimos el usuario y la contraseña.

![comprobacion-autenticacion2](./img/cp7.png)

donde al introducir el usuario y la contraseña correctamente se mostraria la pagina web.

![comprobacion-autenticacion3](./img/cp8.png)

Y lo mismo para el usuario cervera.

![comprobacion-autenticacion4](./img/cp9.png)

donde al introducir el usuario y la contraseña correctamente se mostraria la pagina web.

![comprobacion-autenticacion5](./img/cp10.png)





