# openfire
XMPP OpenFire on Docker

# How to use this image
## start a postgres instance
```bash
docker run -d --name db -e POSTGRES_USER=openfire -e OPSTGRES_PASSWOR=secret postgres
# create database
docker run --rm -it --link db:db eszz/openfire /bin/bash
psql -h db -U openfire -W -d openfire -f /usr/share/openfire/resources/database/openfire_postgresql.sql
exit
```


## Start OpenFire whit postgres db mapping
```bash
docker run -d --name openfire --link db:db -p 5222:5222 -p 7777:7777 -p 9090:9090 eszz/openfire
```

## Check log by
```bash
docker logs openfire
```

## Get in to container
```bash
docker exec -it openfire /bin/bash
```
