
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
# we know that our application is listining on port 5000, so within docker i could access my application on port 5000, but what if i need to access myApp from outside of container? A: we could use the IP of docker host <eg: 192.168.1.5>, but for that to work you must have mapped the port inside the docker container to a free port on the docker host. for example if i want to users to access myApp through port 80  on my docker host, i could map port 80 of local host to port 5000 on the docker container using <-p> perameter. 
> docker run -p 80:5000 myApp
# so the user can access myApp by going to http://192.168.1.5:80, and all trafic on port 80 on docker host will get routed to port 5000 inside the docker container. this way you can run multiple instances of your application and map them to diffrent ports on the docker host, or run instancess if diffrens applications on diffrent ports
> docker run -p 80:5000 myApp
> docker run -p 81:5000 myApp
> docker run -p 82:5000 myApp



# The docker container has it's own isolated file system
# jab ham docker container ko stop karty hen yar wo crash ho jata h to us ka sara data destroy ho jata h, ab hame agar koi esa kaam karna h jis me hame data ko zaya nahi hony dena to local par koi folder bana kar docker sy us folder ko mount karwa den, phir docker k andar us mounted folder me jo bhi save karen gy wo local waly folder me hi aa raha ho ga, or docker destroy hony k bad bhi data zaya nahi ho ga.
> docker run -v your/local/directory:/var/lib/mysql
# ab ye ho ga k docker me jo /var/lib/mysql ho ga wo darasal mery your/local/directory ka alias ho ga.

docker inspect image_Name .......... detailed info about specific container


# logs
docker logs container_Name | container_ID ... logs(what should print in the terminal in the atteched mode) of the container running in the backgroud.
docker inspect container_Name | container_ID | grep -i ipaddress ........ get container ipaddres


# Build an Image
docker build Docker_File -t Amir/my_App

# All the layeser built are cached by docker, so in case of particuler step was to failed you have to fix the issue, and rerun ;
> docker build Docker_File -t Amir/my_App
> docker build . -t Amir/my_App
# it will reuse the previous layeser from cache and continue to  build the remaining layeser. the same is true if you ware to add additional steps in the docker file, this way; rebuilding the image is faster and you dont have to wait for docter to rebuild the entire image each time, this is helpfull when you update source code of your application, only the layers ABOVE the updated layers needs to be rebuilt. 

# your can containarize every thing (eg: curl, chrome), (me ny suna tha k GUI waly applications containarize nahi ho sakti like web browser)


docker run -it ubuntu bash ............... start an ubuntu container and make it live (agar ham <bash> nahi run karen gy to ubuntu ka container on ho ga, or immediately off ho jay ga)

# CMD in docker file
# jab ham image banaty hen to CMD option ko use karty hwy ham wo command  define karty hen jo container start hony k baad  chalay ga. eg: CMD sleep 10. CMD me ham ya to command likhty hen (CMD sleep 5), ye list form me likhty hen (CMD ["sleep", "5"]). Note: agar ham list use karen to us ka pehly element hamesha executable ho ga, eg(ls)
# NOTE: jab ham docker run k aagy command specify kar dety hen (eg: docker run ubuntu_image sleep 10), to wo CMD option ko override kar deti h. is ka falsafa ye h k docker container ksi 1 kaam k lye banta h, ab ya to us kaam ko CMD me likh len ya docker run karty waqt manutally specify kar den.

# ENTRYPOINT
# opar wali misal me ham ubuntu ki image ko sleep n karna chahte hen, or ye n har dafa change ho sakta h, kabhi hame 5 seconds sleep kartna or kabhi 7 ..., to is ko ham CMD me nahi likh sakty q k wo to hard coded ho jay ga, jab k hamara (n) to change ho raha h, or agar ham isy docker run k sath likhen gy to har dafa sleep bhi type karna pary ga jo k constant h, to ham ENTRYPOINT use karty hen, eg(ENTRYPOINT["SLEEP"]), or phir container run karen gy: docker run ubuntu 10. ab 1 or masla h, wo ye k command to ham ny hardcoded kar di, or parameter user dy ga (n), agar user ny perameter na dya to kya ho ga? ham ye karen gy k perameter ki default value set kar len gy, or wo esy k ENTRYPOINT and CMD dono use kare gy, ENTRYPOINT me command define karen gy taky wo har dafa chaly, or CMD me (perameter(n)) define karen gy, agar user ny input nahi dya to CMD value value ENTRYPOINT ka parameter ban kar command execute ho gay gi, or agar user ny value dy di to CMD override ho jay ga. eg:
# ENTRYPOINT["sleep"]
# CMD["5"]
# NOTE: ENTRYPOINT and CMD ko 1 sath specify karny k lye zaroori h k wo dono list(list ko yahan wo json bol raha h) form me hon.
# Q: agar ham ny ENTRYPOINT define kar dya h, or runtime par hame ENTRYPOINT bhi change karna h to kya karen?
# A: docker run --entrypoint command image_name perameter(n)

--link 
# create a link between two containers. so one of them access data of other
docker run -d --name=db mysql
docker run -d --name=ubuntu --link db:db ubuntu
# Note: in --link the <db:db> is equal to <db>, so type whatever you want.

#------------------------------------------------ docker-compose
# see /home/amir/github/Notes/PNG_Notes/image_4.png
# jab hamary pas more than one containers hoty hen jo 1 dusry par dependent hoty hen, to ham aasani k lye un sary containers ki info 1 docker-compose.yml file me likh kar us file ko run kar dety hen.
cat > docker-compose.yml

container_1_Name:
	image:
		image_1_Name:
    links:
    	- container_3_Name # is container ka link container_3 sy hen
container_2_Name:
	image:
		image_2_Name:
 	ports:
		- 5000:8080
    links:
    	- container_3_Name # is container ka link container_3 sy hen
container_3_Name:
	image:
		image_3_Name:
	ports:
		- 5010:8878

and then run this file by:
> docker-compose up

# Note: zaroori nahi h k docker-compose me likhy hwy sary containers hamary pas pehly sy bany hwy hon, agar esa ho k hamary pas 1 folder me app rakhi hwi h magar abhi tak ham ny us app ka container nahi banaya h to zaroori nahi ham pehly manually us ka container banaen or phir usy docker-compose.yml me likhen, instead ham ye kar sakty hen k <image> line ko <build> line sy replace kar den gy, or us directory ka path de den gy jahan hamari app and Dockerfile rakhi hwi h, eg:
before> image: image_name
after > build: ./my_app_directory



# docker-compose.yml k abhi tak 3 versions aa chuky hen, jo oopar ham nydekha wo verions1 tha, version 2 or version 1 me ye diffrences hen:
# v2 me <links> ki zaroorat nahi h. (in v1 docker-compose attaches all the containers to the default bridged network, and then use links to enable compunication between the containers. in V2 docker-compose automaticaly creates dedicated bridged network for this application, and then attaches all containers to that new network, all containers are then able to compunicate to each other using each others services names, so we dont need to use <-links> in V2.)
# v1 me dependency nahi configure ho sakti k jab tak falan container na chaly tab tak falan container na chalao. v2, and v3 me ye configer kar sakty hen. (jo container depended ho us k andar 1 pair likh len: depends_on: - x_container_name)
# v2 or v3 ki start line ye ho gi : <version: version_number>
# v2 or V3 ki second line ye ho gi: <services:> , or jo kuch version one me tha wo sara k block k andar aa jata h.


# ------ networks in V3
# agar hame ye karna h k hamari application k kuch containers backend network use karen, kuch frontend and kuch both to ham <services> k block sy bahir aa kar ye:
networks:
	font-end:
	back-end:
# likhen gy, or phir har container me 1 pair add karen gy, us ki key <networks> ho gi, and value/s front-end ya back-end ye dono alag alag line me ho ga. see /home/amir/github/Notes/PNG_Notes/image_5.png
#------------------------------------------------ 


#----------------- Docker Engine
# when you install Docker on a linux host you're actually installing three diffrent compenents:
1- Docker Deamon
	# it is a backgroud process that manages docker objects such as the images, containers, volumes and networks.
2- Rest API
	# The API interface that programs can use to talk to the Deamon and provide instructions.
3- Docker CLI
	# it uses the rest API to interect with the docker demon. 
	# NOTE: not necessarily be on the same host. it could be on another system like a laptop and can still work with a remote Docker Engine. if we neet to run a container based on nginx on a remote docker host run the command: 
	> docker -H=10.123.2.1:2375 run nginx
#-----------------

# by default there is no restriction as to how mush of a resource a container can use and hence a container may end up utilize all of the resource on the underlying host. but there is a way to restrice the amount of CPU or Memory a container can use. 
> docker run --cpu=.5 container_Name # this container using at most 50% of total CPU.
> docker rum --memory=1000m container_Name # this container using at most 1000MB of memory.



# ---------------------- Storage
# when you install a docker on a system it creates below folder structure at /var/lib/docker, here docker stores its data(images, containers running on the host) by default, you have multiple folders under it.
/var/lib/docker
	aufs
	containars
	image
	volumes

# when docker build images it build these in a layered architecture. each line of instruction in the Dockerfile creates a new layer in th Docker image with just the changes from the previous layer. 
# To understand the advantages of this layered architecture lets say:
# ham ny 1 app ki image bana li h, is image ki starting 3 layers ye hen: ubuntu, python, update. ab hame 2nd app ki image banani h, or is app me bhi hamy shuru me wohi 3 layers banani hen, to jab me 2nd app ki image banaun ga to docker first 3 layers ko build nahi kary ga balky cache sy 1st image ki hi starting 3 layers ly kar 2nd image  me laga dy ga(yani k starting 3 layeres HDD me 1 hi jaga hon gi, or dono images is ko ram me alag alag use kar rahi hon gi, HDD me wo 1 hi jaga hon gi), jis sy time bohot bachy ga or disk space bhi.


# images read-only hoti hen, agar us me koi changing karni ho to poori image dubara banani hoti hy, docker me achi baat ye h k maslan mery pas 12 layers ki image h, or me ny layer 8 ka code update karna h, or is lye mujhy image rebuild karni hy, to jab docker is ko rebuild kary ga to first 7 layers rebuild nahi kary ga balky unhe cache sy ly ly ga, or updated or us k bad wali layers rebuild kary ga.

# when you run a container based on image (whish is read-only) docker creates a new writable layer on top of the image layers. this writeable layer is used to store data by the container such as log files by the applications, logs, any temporary files generated by the container or just any file modeified by the user on that container. the life of this writeable layer is only as long as the container is alive.  


# when you install a docker its creates 3 networks automaticaly:
	1- bridge
		default network a container gets attached to. if you would like to accosiate the container with any other network specify the network information using the <--network> parameter, eg:
		docker run ubuntu 
		docker run ubuntu --network=none
		docker run ubuntu --network=host
		it is a private internal network created by docker on the host, all containers attached to this network by default, and they get an internal IP address, usually in the range 172.17 series, the containers can access each other using this internal IP if required. to access any of these containers from the outside world map the port of this container top ports on the docker host. another say to access the container externaly is to accosiate the container to the host network, this takes out any network isolation between the docker host and the docker container, meaning if you were to run a web server on port 5000 in a web container it is automaticaly as accessible on the same port externaly without requiring any port mapping as the web container uses the hosts network, this would also mean that unlike before you will now not be able to run multiple web containers on the same host on the same port as the ports are now common to all containers in the host network.
	2- none
		The containers are not atteched to any network and doesn't have any access to the external network or other containers they are run in an isolated network. 

	3- host

what if we wis hto isolate the containers within the docker host? for example the first two web containers on internal network 172 and the second two containers on a different internal network like 182, by default Docker only created one internal bridge network. but we could create our own internal network (docker network create --driver bridge --subnet 182.18.0.0/16 custom-isolated-network), (<bridge> here dirver).
> docker network ls  ....... list networks.

How do we see the network settings and IP address assinged to an existing containers?
> docker inspect container_Name | container_ID
see there <Networks> section.


containers can reach each other using their names, (ye apni IP k zarye bhi 1 dusry ko pehchan sakty hen, magar masla ye h k is bat ki koi garantee nahi h k rebot k bad bhi usy same IP mily gi, jab container ka name change nahi hota.)
Docker has a built in DNS server that helps the containers to resolve each other using the container name. Note that built in DNS server always run at address 127.0.0.11.
Q: so How does Docker implement networking?
A: Dcoker uses network names spaces that creates a separete namespace for each container, it then uses virtual Ethernet pairs to connect containers together.




docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag



Q: Deploy a web application named webapp, using image kodekloud/simple-webapp-mysql. Expose port to 38080 on the host. The application takes an environment variable DB_Host that has the hostname of the mysql database. Make sure to attach it to the newly created network wp-mysql-network
A: docker run -p 38080 --name webapp -d --network wp-mysql-network -e DB_Host=mysql-db kodekloud/simple-webapp-mysql


# ----------------- Docker registry
Q: what is registry?
A: where docker images are saved.

when we run docker container we should mention registry, user_account and repositry_name eg:
> docker run registry/user_account/repositry_name
> docker run docker.io/nginx/ngix

registry default is: docker.io
user_account default is: repositry_name

to agar me srif 1 hi argument(x) dun ga to ye dono default is k sath mil kar u ho jay ga:
> docker run x
> docker run docker.io/x/x

there are many registries, like gcr.io (for google)


when you have applications built in house that should not be availible to the public hosting an internal private registry mey be a good solution, to run a container using an image from a private registry you first login to your private registry:
> docker login private-registry.io
then
> docker run private-registry.io/apps/internal-app




How to deploy you own registry witiin your orgnization?
A: the docker registry is itself an another application (it is availible as a docker image, the name of the image is a registry, and it is exposes the API on port 5000)
> docker run -d -p 5000:5000 --name registry registry:2

now that you have your custom registry running at port 5000 on this docker host, how to push you own image to it?
A:
> docker image tag-image localhost:5000/my-image
> docker push localhost:5000/my-image

and then pull this image within your local network:
if you on the same host:
	> docker pull localhost:5000/my-image
of the IP or domain name of my docker host if i accessing from anohter host in my invoirment:
	> docker pull 192.168.56.100:5000/my-image

Deploy a mysql database using the mysql:5.6 image and name it mysql-db. Attach it to the newly created network wp-mysql-network, Set the database password to use db_pass123. The environment variable to set is MYSQL_ROOT_PASSWORD
docker run -d --name=mysql-db --network wp-mysql-network -e MYSQL_ROOT_PASSWORD=db_pass123 mysql:5.6