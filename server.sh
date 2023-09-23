docker run --detach --name=mysql-dev --publish 3306:3306 --env="MYSQL_ROOT_PASSWORD=alhamsya" mysql
docker run --detach --name=postgres-dev --publish 5432:5432 --env="POSTGRES_PASSWORD=alhamsya" --env="POSTGRES_USER=root" postgres


docker run --detach --name=ngrok-dev --publish 4040:4040 --env="NGROK_AUTHTOKEN=27EiLumvAGVpufphjHECeelPKNS_ptMDYMJF84cDefEu6RVv" ngrok/ngrok http -host-header=rewrite localhost:10001

docker run --detach --publish 4040:4040 --name=ngrok-dev wernight/ngrok ngrok http 80

docker run --detach --name=mysql-dev --restart unless-stopped --publish 3306:3306 --volume mysql-volume:/var/lib/mysql --env="MYSQL_ROOT_PASSWORD=zarra123" mysql