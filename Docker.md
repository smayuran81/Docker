# How to build java docker

## Constructing docker image

1. FROM eclipse-temurin:17 : select the image you want to use for base image 
2. RUN mkdir /app : 
3. #RUN ["executable", "param1", "param2"]
4. WORKDIR /app
5. COPY target/api.jar app.jar
6. EXPOSE 8080 : This will expose the port 8080
7. ENTRYPOINT ["java", "-jar", "app.jar"] : This is the command it needs to run

#### Creating docker build
Run the following command
docker build -f docker.Dockerfile -t my-api .

### Run the docker image
docker run -p 9000:8080 -it my-api

### fabric8io maven plugin
In the plugin section add io.fabric8 docker maven plugin
Here you can define complete configuration which enables you to set up every thing
running maven build:package will create an docker image , this will be inside target folder
Then you run maven docker:run

### Spring build image: mvn spring-boot:build
1. make use of layering
2. order in such a way with frequency of change
3. Build packs and layerd jar

### Google jib 

This can used to build images in maven just giving the plugin name, it makes assumptios
what needs to be created

### running postgres docker
1. How to run postgres docker
 docker run -it --rm \
 -p 5432:5432 \
 -e POSTGRES_PASSWORD=1234 \
 -e POSTGRES_DB=bookdb \
 -v ${PWD}/db:/var/lib/postgresql/data \
 --net web-db --name db postgres
2. How to connect to admin: pgAdmin4

### Docker networks
To create docker netwrok : docker network create web-db
To list docker network: docker network ls
To inspect docker network : docker network inspect web-db
1. containers belonging to different networks cannot communicate with each other
2. They need to belong to same network to connect 

### Docker Compose
To run multiple containers
1. In the docker compose file you can have services section which can list the services
2. Configuration for this services can be given in docker compose file

### Environment variables

1. ENV section in the file can set the environment variable
2. ENV VERSION=1 ENV DB mysql : All this env variable is available during the run time of
3. LABEL $LABEL WORKDIR ${DIR}
4. docker run -e FILE="my file.txt" my-image
5. docker run --env DB my-image
6. load a file from env-file docker run --env-file env.dev my-image
7. in the docker file you can set spring active profile: ENV SPRING_PROFILES_ACTIVE=dev 

### Entry Point

1. At least one entry point should be configured
2. Entry point should be defined when using the container as an executable