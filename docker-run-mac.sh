
docker network create --driver bridge --subnet 182.28.0.0/16 --gateway 182.28.0.1 docker-network

docker run --detach --name=mysql-test --net docker-network --ip 182.28.0.2 --publish 3306:3306 --volume mysql-volume:/var/lib/mysql --env="MYSQL_ROOT_PASSWORD=alhamsya" --platform linux/amd64 mysql:5.7

docker run --detach --name=redis-test --net docker-network --ip 182.28.0.3 --publish 6379:6379 --privileged=true --volume redis-volume:/data redis --requirepass  "alhamsya"

docker run --detach --name=postgres-test --net docker-network --ip 182.28.0.4 --publish 5432:5432 --volume postgres-volume:/var/lib/postgresql/data --env="POSTGRES_PASSWORD=alhamsya" postgres

docker run --detach \
--platform linux/amd64 \
--name sonarqube-test \
--net docker-network \
--ip 182.28.0.5 \
--publish 9000:9000 \
--volume sonarqube-volume_conf:/opt/sonarqube/conf \
--volume sonarqube-volume_extensions:/opt/sonarqube/extensions \
--volume sonarqube-volume_logs:/opt/sonarqube/logs \
--volume sonarqube-volume_data:/opt/sonarqube/data \
sonarqube:9.3-community # port-ui:9000

docker run --detach \
--name=metabase-test \
--net docker-network \
--ip 182.28.0.6 \
--publish 3000:3000 \
--volume metabase-volume:/metabase-data \
--env "JAVA_OPTS=-Xmx6g" \
--platform linux/amd64 \
metabase/metabase # port-ui:3000

docker run --detach --name=rabbitmq-test --net docker-network --ip 182.28.0.7 --publish 15672:15672 --publish 5672:5672 --volume rabbitmq-volume:/var/lib/rabbitmq rabbitmq:3-management

docker run --detach --name=toxiproxy-test --net docker-network --ip 182.28.0.8 --publish 8474:8474 shopify/toxiproxy

docker run --detach --name=jaeger-test --net docker-network --ip 182.28.0.9 --publish 6831:6831/udp --publish 16686:16686 --volume jaeger-volume:/tmp --env="JAEGER_AGENT_HOST=jaeger-test" jaegertracing/all-in-one:latest

docker run --detach \
--name=vault-test \
--net docker-network \
--ip 182.28.0.10 \
--publish 8200:8200 \
--volume vault-volume:/vault/logs \
--volume vault-volume:/vault/file \
--cap-add=IPC_LOCK -e 'VAULT_DEV_ROOT_TOKEN_ID=alhamsya' -e 'VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200' \
vault # port-ui:8200

docker run --detach \
--name=redis-old-test \
--net docker-network \
--ip 182.28.0.11 \
--publish 6379:6379 \
--volume redis-volume-old:/data \
redis:5.0 # port-ui:6379

docker run -it --name=ngrok-test --net docker-network ngrok/ngrok http 10002
docker run -it --name=ngrok-test --net docker-network --ip 182.28.0.12 --publish 3000:4040 ngrok/ngrok http 10002

docker run --detach \
--name=sftp-test \
--net docker-network \
--ip 182.28.0.13 \
--publish 2222:22 \
--volume /Users/alhamsya/Desktop/sftp-volume/BCA/ext-kbcmarthas/pemrek/online/out:/home/alhamsya/BCA/ext-kbcmarthas/pemrek/online/out \
--volume /Users/alhamsya/Desktop/sftp-volume/BCA/ext-kbcmarthas/pemrek/online/in:/home/alhamsya/BCA/ext-kbcmarthas/pemrek/online/in \
atmoz/sftp alhamsya:alhamsya

docker run \
--name=gcp-pubsub-emulator-ui-test \
--net docker-network \
--ip 182.28.0.14 \
--publish 8680:8080 \
--env PUBSUB_EMULATOR_HOST=localhost:8085 \
--env GCP_PROJECT_IDS=stockbit-api-dev \
echocode/gcp-pubsub-emulator-ui

docker run --detach \
--name=redis-test \
--net docker-network \
--ip 182.28.0.15 \
--publish 6378:6379 \
--volume redis-volume:/data \
redis # port-ui:6378

docker run --detach \
--name=pubsub-ui-test \
--net docker-network \
--ip 182.28.0.16 \
--publish 4200:80 \
--volume pubsub-ui-volume:/data \
pubsub-ui

docker run --detach \
--name=sql-test \
--env="ACCEPT_EULA=1" \
--env="SQL_SA_PASSWORD=MyPass@word" \
--env="SQL_PID=Developer" \
--env="SQL_USER=SA" \
--ip 182.28.0.17 \
--publish 1433:1433 \
mcr.microsoft.com/azure-sql-edge

docker run --detach \
--name=arangodb-test \
--env="ARANGO_ROOT_PASSWORD=alhamsya" \
--ip 182.28.0.18 \
--publish 8529:8529 \
--volume /arangodb:/var/lib/arangodb3 \
--volume /arangodb/logs/:/var/log/arangodb3 \
arangodb:latest

docker run -d \
--ip 182.28.0.19 \
--publish 8529:8529 \
--volume $HOME/flipt:/var/opt/flipt \
--volume $HOME/flipt/config.yaml:/etc/flipt/config.yaml \
docker.flipt.io/flipt/flipt:latest # port-ui:1000

docker compose -f ./nsq.yml -p nsq up -d # port-ui:1200

docker compose -f ./redpanda.yml -p redpanda up -d # port-ui:1300

docker run -d \
    --name flipt \
    -p 8080:8080 \
    -p 9000:9000 \
    -v $HOME/flipt:/var/opt/flipt \
    docker.flipt.io/flipt/flipt:v1.50.1


docker run -v </a/local/data/folder>:/pgdata -e PGDATA=/pgdata \
    -d --name timescaledb -p 5435:5435 -e POSTGRES_PASSWORD=alhamsya timescale/timescaledb:latest-pg18