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