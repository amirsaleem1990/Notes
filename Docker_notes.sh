
docker version ........... check docker version
# docker hub .......... hub.docker.com
print hello-world on screen ........... docker run docker/whalesay cowsay Hello-world
docker run .............. run docker from an image on the docker host if the image is exist in local, if image is not present on the host it will go out to docker hub and pulled image down, but this is only done the first time. for the subsequant executaion the same image will be reused.
docker ps  .............. list all running containers, and some basic information about them.
docker ps -a ...........  to see all containers running or not, all running as well as previously stoped or exited containers. Note: not list deleted containers.
docker stop <container_ID|container_Name> ............ to stop a container.
docker rm <container_Name> ............ to remove a stoped/exited container permenantily. Note: remove multiple containers in one command ............. docker rm cont1_Name cont2_Name 
docker rmi <image_Name> ........... to remove an image perminently. Note: you must ensure that no containers are running of that image before attempting to remove the image. you must stop and delet all dependent containers to be able to delete an image. Note: docker run ubuntu, now ubuntu container started and immeditely stoped, now of i try to remove ubuntu image <docker rmi ubuntu>; i can not. first i should delete containers dependent on ubuntu (there is only one container that is dependent on ubuntu image, and that contains in exited, and we can not find it in <docker ps>), and then i can remove ubuntu image.

docker images ......................... list all images present on our host.
docker pull image_Name  ............... download an image

# if we run <docker run ubuntu> we would'nt see container running, it is started and then exited. so what is that? A: unlike virtual machines; containers are not meant to host an operating system. containers are ment to host a specific task or process such as to host an instance of web server, or application server, or database or any application. once the task is completes the container exits. the container only lives as long as the process inside it is a live. if the web serivce inside the container stoped or crashed then the container exits. this is why when you run a container from an ubuntu image is stops immediately, bacause ubuntu is an image of operating system that is used as the base image for other applications, there is no process opr application running in it by default, if the image isn't running any service as is the case with ubuntu you could instrect docker run a process with the <docker run> command, for example: <docker run ubuntu sleep 5>.

dockder exec container_Name | container_ID command ... executing a command on a running container

# Run - attach and detach
docker run image_name ................. runs in the foreground (attachded mode), you will be attaced to the console or the standard out of the docker container and you will see the output of the application on your screen. you won't be able to do anything else in this console until this docker container stops. 
docker run -d image_name .............. runs in the backgroud  (detached  mode), and you will be back to your prompt immediately, the container will continue to run in the backend.
docker attach container_Name | container_ID ... attach back to the running container.
# if you run <docker run image_Name> and image_Name not present in host docker try to download images from docker hub, and download latest version of image_Name, so how we can specify the old version if we need so? A: docker run image_Name:version_Number, this specification is called tag, the default tag is <latest>

#------------- user input
# by default docker container is not listen to user input, even though you are attached to console it is not able to read input from you, it does not have a terminal to read inputs from, it runs in non-interctive mode, if you like to provide your input you must map the standard input of your host to the docker container using <-i> paremerter, the <-i> perameter is for interective mode.
docker run -i image_Name ............ can take an input from terminal.
docker run -t image_Name ............ can print on terminal.

# every docker container get an IP assigned by default.
# ------------ port mapping
> docker run myApp 
Running on http://0.0.0.0:5000/
# we know that our application is listining on port 5000, so within docker i could access my application on port 5000, but what if i need to access myApp from outside of cantainer? A: we could use the IP of docker host <eg: 192.168.1.5>, but for that to work you must have mapped the port inside the docker container to a free port on the docker host. for example if i want to users to access myApp through port 80  on my docker host, i could map port 80 of local host to port 5000 on the docker cantainer using <-p> perameter. 
> docker run -p 80:5000 myApp
# so the user can access myApp by going to http://192.168.1.5:80, and all trafic on port 80 on docker host will get routed to port 5000 inside the docker cantainer. this way you can run multiple instances of your application and map them to diffrent ports on the docker host, or run instancess if diffrens applications on diffrent ports
> docker run -p 80:5000 myApp
> docker run -p 81:5000 myApp
> docker run -p 82:5000 myApp


# The docker container has it's own isolated file system
# jab ham docker container ko stop karty hen yar wo crash ho jata h to us ka sara data destroy ho jata h, ab hame agar koi esa kaam karna h jis me hame data ko zaya nahi hony dena to local par koi folder bana kar docker sy us folder ko mount karwa den, phir docker k andar us mounted folder me jo bhi save karen gy wo local waly folder me hi aa raha ho ga, or docker destroy hony k bad bhi data zaya nahi ho ga.
> docker run -v your/local/directory:/var/lib/mysql
# ab ye ho ga k docker me jo /var/lib/mysql ho ga wo darasal mery your/local/directory ka alias ho ga.

docker inspect image_Name .......... detailed info about specific cantainer
