
docker run --detach --name=mysql-test --net docker-network --ip 182.28.0.2 --publish 3306:3306 --volume mysql-volume:/var/lib/mysql --env="MYSQL_ROOT_PASSWORD=alhamsya" mysql:5.7.25

docker run --detach --name=redis-test --net docker-network --ip 182.28.0.3 --publish 6379:6379 --privileged=true --volume redis-volume:/data redis --requirepass  "alhamsya"

docker run --detach --name=postgres-test --net docker-network --ip 182.28.0.4 --publish 5432:5432 --volume postgres-volume:/var/lib/postgresql/data --env="POSTGRES_PASSWORD=alhamsya" postgres

docker run --detach \
    --name sonarqube-test \
    --net docker-network \
    --ip 182.28.0.5 \
    --publish 9000:9000 \
    --volume sonarqube-volume_conf:/opt/sonarqube/conf \
    --volume sonarqube-volume_extensions:/opt/sonarqube/extensions \
    --volume sonarqube-volume_logs:/opt/sonarqube/logs \
    --volume sonarqube-volume_data:/opt/sonarqube/data \
    sonarqube:7.9-community

docker run --detach --name=metabase-test --net docker-network --ip 182.28.0.6 --publish 3000:3000 --volume metabase-volume:/metabase-data metabase/metabase  

docker run --detach --name=rabbitmq-test --net docker-network --ip 182.28.0.7 --publish 15672:15672 --publish 5672:5672 --volume rabbitmq-volume:/var/lib/rabbitmq rabbitmq:3-management


