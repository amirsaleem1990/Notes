
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

# if we run <docker run ubuntu> we would'nt see container running, it is started and then exited. so what is that? A: unlike virtual machines; containers are not meant to host an operating system. containers are ment to host a specific task or process such as to host an instance of web server, or application server, or database or any application. once the task is completes the container exits. the container only lives as long as the process inside it is a live. if the web serivce inside the container stoped or crashed then the container exits. this is why when you run a container from an ubuntu image is stops immediately, bacause ubuntu is an image of operating system that is used as the base image for other applications, there is no process opr application running in it by default, if the image isn't running any service as is the case with ubuntu you could instrect docker run a process with the <docker run> command, for example: <docker run ubuntu sleep 5>.

dockder exec container_Name command ... executing a command on a running container

# Run - attach and detach
docker run image_name ................. runs in the foreground (attachded mode), you will be attaced to the console or the standard out of the docker container and you will see the output of the application on your screen. you won't be able to do anything else in this console until this docker container stops. 
docker run -d image_name .............. runs in the backgroud  (detached  mode), and you will be back to your prompt immediately, the container will continue to run in the backend, 

