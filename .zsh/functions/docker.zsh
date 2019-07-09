# Login to Docker container
docker-login(){
  docker exec -ti "${1}" /bin/bash
}
