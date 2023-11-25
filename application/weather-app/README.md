## Repositories
```
devopseasylearning/sixfure-db:develop
devopseasylearning/sixfure-redis:develop
devopseasylearning/sixfure-ui:develop
devopseasylearning/sixfure-weather:develop
devopseasylearning/sixfure-auth:develop
```

## Create aws ECR repos
```
aws ecr create-repository --repository-name aws-ecr-docker --region us-east-1
aws ecr create-repository --repository-name <your-repo-name> --region <your-region>

aws ecr create-repository --repository-name sixfure-db --region us-east-1
aws ecr create-repository --repository-name sixfure-redis --region us-east-1
aws ecr create-repository --repository-name sixfure-ui --region us-east-1
aws ecr create-repository --repository-name sixfure-weather --region us-east-1
aws ecr create-repository --repository-name sixfure-auth --region us-east-1
```


## ECR URL
```
788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-db:develop
788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-redis:develop
788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-ui:develop
788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-weather:develop
788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-auth:develop

docker build -t 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-db:develop . 
docker build -t 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-redis:develop . 
docker build -t 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-ui:develop .
docker build -t 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-weather:develop .
docker build -t 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-auth:develop .
```


## login into ecr
```sh
aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <ECR-REPOSITORY-URI>

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-db

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-redis

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-ui

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-weather

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 788210522308.dkr.ecr.us-east-1.amazonaws.com/sixfure-auth
```

## Requirements
- Use datadog to minitor containers
- Added a new DB for mysql

```sh
## Variables for UI service:
AUTH_HOST= auth
AUTH_PORT=8080
WEATHER_HOST= weather
WEATHER_PORT= 5000
REDIS_USER=redis
REDIS_PASSWORD=redis

## Variables for Weather service:
APIKEY = ecbc396f46mshb65cbb1f82cf334p1fcc87jsna5e962a3c542

## Variables for Auth service:
DB_HOST= db
DB_PASSWORD= my-secret-pw

## Variables for db service:
MYSQL_ROOT_PASSWORD= my-secret-pw

## Variables for redis service:
REDIS_USER=redis
REDIS_PASSWORD=redis

## Variables for redis service:
REDIS_USER=redis
REDIS_PASSWORD=redis	
```


## Volume Mount
```
docker volume ls
ls -l /var/lib/docker/volumes
ls -l /var/lib/docker/volumes/weather-app_db-data/_data/
ls -l /var/lib/docker/volumes/weather-app_redis-data/_data/
```

## Issue with restarting when changing Redis and DB password
- Stop compose
- Delete all volume 
- Start compose 
- This is because the password was already persisted
```
docker-compose down
docker volume ls
docker volume rm weather-app_db-data
docker volume rm weather-app_redis-data
```

## Login and check users that sign up already as root
```sh
docker exec -it [DB_CONTAINER_ID] bash
docker exec -it 470c55283eb9 bash
mysql -u root -p

SHOW DATABASES;
USE auth;
SHOW TABLES;
SELECT * FROM users;
```

## Login and check users that sign up already as admin
```sh
docker exec -it [DB_CONTAINER_ID] bash
docker exec -it 470c55283eb9 bash
mysql -u admin -p weatherapp

SHOW DATABASES;
USE weatherapp;
SHOW TABLES; ## This will be empty because we don't have anything store in there. everything is stored in the default table and admin do not have access. Most login as root
USE auth;
SELECT * FROM users;
```

## To grant the MySQL user "admin" access to all databases, you can follow these steps:
```
mysql -u root -p
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'GzWNQY8eH4YBkt8HutZj@*J';
FLUSH PRIVILEGES;
exit
```

## Volume mount on host
mkdir -p /data/redis-data/
mkdir -p /data/db-data

chmod -R 777 /data/redis-data
chmod -R 777 /data/db-data


