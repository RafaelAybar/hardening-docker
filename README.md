# hardening-docker
Repositorio donde se configurá y testeará docker de forma segura en máquinas Ubuntu 20.04 o Debian Testing

Para ello instalaremos Docker y Docker-compose sin privilegios de administración, ejecutando el script **sin sudo** de la siguiente manera:

`bash instalador.sh`

Este scrips sólo pedirá permisos de administrador para gestionar los pre-requisitos. Es importante añadir al fichero `.profile` los siguiente datos:

```
    export PATH=/home/TU_USUARIO/bin:$PATH
    export PATH=$PATH:/sbin
    export DOCKER_HOST=unix:///run/user/TU_ID_USUARIO/docker.sock
```

Una vez instalado Docker sin privilegios, procedemos a instalar [Trivy](https://github.com/aquasecurity/trivy#installation).

Cuando esté instalado, creamos una carpeta para los informes con el comando `mkdir informes`

Ahora, vamos a analizar una imagen de MySQL 8.


```trivy image mysql > reportes/reporte_06_02_2021_mysql8.txt```

Y el fichero contendrá:

``` 2021-02-06T17:59:23.910+0100	WARN	You should avoid using the :latest tag as it is cached. You need to specify '--clear-cache' option when :latest image is changed
2021-02-06T17:59:23.927+0100	INFO	Detecting Debian vulnerabilities...
2021-02-06T17:59:23.940+0100	INFO	Trivy skips scanning programming language libraries because no supported file was detected

mysql (debian 10.7)
===================
Total: 144 (UNKNOWN: 1, LOW: 93, MEDIUM: 11, HIGH: 39, CRITICAL: 0) ```


Seguido de una tabla donde explicarán las vulnerabilidades con un poco más de detalle.