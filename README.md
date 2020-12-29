# hardening-docker
Repositorio donde se configurá y testeará docker de forma segura en máquinas Ubuntu 20.04 o Debian Testing

Para ello instalaremos Docker y Docker-compose sin privilegios de administración, ejecutando el script **sin sudo** de la siguiente manera:

`bash instalador.sh`

Este scrips sólo pedirá permisos de administrador para gestionar los pre-requisitos. Es importante añadir al fichero `.profile` los siguiente datos:

```
    export PATH=/home/TU_USUARIO/bin:$PATH
    export PATH=$PATH:/sbi0n
    export DOCKER_HOST=unix:///run/user/TU_ID_USUARIO/docker.sock
```
