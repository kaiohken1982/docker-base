# Creazione immagine base

Crazione immagine base a partire da ubuntu20.
Ricorda di mantenere segreta la chiave ssh e rimuoverla da authoruizedKeys

## Per il build dell'immagine

docker build -f base.Dockerfile -t docker-locale/base .

## Per lanciare il container

docker run -id docker-locale/base bash

## Creazione della chiave SSH

ssh-keygen -t ed25519

Come nome inserire per comodità "sshKey", 
questa sarà creata nella directory corrente.
Servirà per connetterci via ssh in un secondo momento

## Recuperare il container id 

docker container ls

## Connettersi al suo interno 

docker exec -ti <CONTAINER-ID>

ed abilitare il servizio ssh

## Abilitare accesso SSH

creare file /etc/ssh/sshd_config.d/authentication.conf

vim /etc/ssh/sshd_config.d/authentication.conf

con il seguente contenuto

# Authentication

#PermitRootLogin prohibit-password
PermitRootLogin yes

Impostare password di root con passwd

riavviare ssh "service ssh restart"

## Copia la chiave ssh in authorization keys e prova a connetterti

ssh-copy-id -i ./sshKey root@<CONTAINER-IP-ADDRESS>
ssh -i sshKey root@<CONTAINER-IP-ADDRESS>

## Disattiva l'accesso con password

Abilita PermitRootLogin in authentication.conf 
e riavvia ssh server

## Aggiornare immagine locale con le modifiche

docker commit <CONTAINER-ID> docker-locale/base

## Stoppare il container

docker container stop <CONTAINER-ID>

