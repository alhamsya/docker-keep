docker run --detach --name=mysql-test --net docker-network --ip 182.28.0.2 --env="MYSQL_ROOT_PASSWORD=alhamsya" mysql

docker run --detach --name=redis-test --net docker-network --ip 182.28.0.3 redis

docker run --detach --name=postgres-test --net docker-network --ip 182.28.0.4 --env="POSTGRES_PASSWORD=alhamsya" postgres

docker run -d \
    --name sonarqube-test \
    --net docker-network \
    --ip 182.28.0.5 \
    -p 9000:9000 \
    -v sonarqube_conf:/opt/sonarqube/conf \
    -v sonarqube_extensions:/opt/sonarqube/extensions \
    -v sonarqube_logs:/opt/sonarqube/logs \
    -v sonarqube_data:/opt/sonarqube/data \
    sonarqube:7.9-community

docker run --detach --name=metabase-test --net docker-network --ip 182.28.0.6 -p 3000:3000 metabase/metabase    