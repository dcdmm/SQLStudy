### MySQL8.0 docker部署

```docker
docker pull mysql:8.0

docker run -p 3305:3306 -e MYSQL_ROOT_PASSWORD=123456 -d --name mysql_d mysql:8.0
```