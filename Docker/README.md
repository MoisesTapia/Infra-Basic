# Docker CI/CD

<table class="egt">
  <tr>
    <td colspan="6"><center>Containers</center></td>
  </tr>
  <tr>
    <td>Prometheus</td>
    <td>Grafana</td>
    <td>Node Exporter</td>
    <td>Jenkins</td>
    <td>Alertmanager</td>
    <td>cAdvisor</td>
  </tr>
</table>

## Folders

To use this docker compose you need make a folder named grafana and change it the owner:
- [X] grafana
- [X] changing owner `sudo chown 1000 grafana`

## Enabling services for first time

to up docker-compose just wirte the follow command

```bash
docker-compose up -d
```
## Stoping services

```bash
docker-compose stop
```
after down services if you want enable again you just write this comand, wich enable the services

```bash
docker-compose start
```

## Jenkins Code

To get the password code we need be inside of container but we can execute comands outside container:

```bash
$ docker-compose exec jenkis cat /var/jenkins_home/secrets/initialAdminPassword
$ 741bc43e03b54cd9be183d97947c7369
```
