
check docker version ................ sudo docker version
docker hub .......... hub.docker.com
print hello-world on screen ................ docker run docker/whalesay cowsay Hello-world
docker run ..............run docker from an image on the docker host if the image is exist in local, if image is not present on the host it will go out to docker hub and pulled image down, but this is only done the first time. for the subsequant executaion the same image will be reused.

