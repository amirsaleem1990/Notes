
docker version ........... check docker version
# docker hub .......... hub.docker.com
print hello-world on screen ........... docker run docker/whalesay cowsay Hello-world
docker run .............. run docker from an image on the docker host if the image is exist in local, if image is not present on the host it will go out to docker hub and pulled image down, but this is only done the first time. for the subsequant executaion the same image will be reused.
docker ps  .............. list all running containers, and some basic information about them.
docker ps -a ...........  to see all containers running or not, all running as well as previously stoped or exited containers.
docker stop <container_ID|container_Name> ............ to stop a container.
docker rm <container_Name> ............ to remove a stoped/exited container permenantily.
docker rmi <container_Name> ........... to remove a stoped/exited container permenantily. Note: you must ensure that no containers are running of that image before attempting to remove the image. you must stop and delet all dependent containers to be able to delete an image.
docker images ......................... list all images present on our host.
docker pull image_Name  ............... download an image

# if we run <docker run ubuntu> we would'nt see container running, it is started and then exited. so what is that? A: 
