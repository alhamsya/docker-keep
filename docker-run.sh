docker run --detach --name=mysql-test --net docker-network --ip 182.28.0.2 --env="MYSQL_ROOT_PASSWORD=alhamsya" mysql

docker run --detach --name=redis-test --net docker-network --ip 182.28.0.3 redis

docker run --detach --name=postgres-test --net docker-network --ip 182.28.0.4 --env="POSTGRES_PASSWORD=alhamsya" postgres