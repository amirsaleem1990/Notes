
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


# logs
docker logs cantainer_Name | container_ID ... logs(what should print in the terminal in the atteched mode) of the cantainer running in the backgroud.
docker inspect cantainer_Name | cantainer_ID | grep -i ipaddress ........ get cantainer ipaddres


# Build an Image
docker build Docker_File -t Amir/my_App

# All the layeser built are cached by docker, so in case of particuler step was to failed you have to fix the issue, and rerun ;
> docker build Docker_File -t Amir/my_App
> docker build . -t Amir/my_App
# it will reuse the previous layeser from cache and continue to  build the remaining layeser. the same is true if you ware to add additional steps in the docker file, this way; rebuilding the image is faster and you dont have to wait for docter to rebuild the entire image each time, this is helpfull when you update source code of your application, only the layers ABOVE the updated layers needs to be rebuilt. 

# your can containarize every thing (eg: curl, chrome), (me ny suna tha k GUI waly applications containarize nahi ho sakti like web browser)


docker run -it ubuntu bash ............... start an ubuntu container and make it live (agar ham <bash> nahi run karen gy to ubuntu ka container on ho ga, or immediately off ho jay ga)

# CMD in docker file
# jab ham image banaty hen to CMD option ko use karty hwy ham wo command  define karty hen jo cantainer start hony k baad  chalay ga. eg: CMD sleep 10. CMD me ham ya to command likhty hen (CMD sleep 5), ye lsit fort me likhty hen (CMD ["sleep", "5"]). Note: agar ham list use karen to us ka pehly element hamesha executable ho ga, eg(ls)
# NOTE: jab ham docker run k aagy command specify kar dety hen (eg: docker run ubuntu_image sleep 10), to wo CMD optiojn ko override kar deti h. is ka falsafa ye h k docker container ksi 1 kaam k lye banta h, ab ya to us kaam ko CMD me likh len ya docker run karty waqt manutally specify kar den.

# ENTRYPOINT
# opar wali misal me ham ubuntu ki image ko sleep n karna chahte hen, or ye n har dafa change ho sakta h, kabhi hame 5 seconds sleep kartna or kabhi 7 ..., to is ko ham CMD me nahi likh sakty q k wo to hard coded ho jay ga, jab k hamar n to change ho raha h, or agar ham isy docker run k sath likhen gy to har dafa sleep bhi type karna pary ga jo k constant h, to ham ENTRYPOINT use karty hen, eg(ENTRYPOINT["SLEEP"]), or phir container run karen gy: docker run ubuntu 10. ab 1 or masla h, wo ye k command to ham ny hardcoded kar di, or parameter user dy ga (n), agar user ny perameter na dya to kya ho ga? ham ye karen gy k perameter ki default value set kar len gy, or wo esy k ENTRYPOINT and CMD dono use kare gy, ENTRYPOINT me command define karen gy taky wo har dafa chaly, or CMD me (perameter(n)) define karen gy, agar user ny input nahi dya to CMD value value ENTRYPOINT ka parameter ban kar command execute ho gay gi, or agar user ny value dy di to CMD override ho jay ga. eg:
# ENTRYPOINT["sleep"]
# CMD["5"]
# NOTE: ENTRYPOINT and CMD ko 1 sath specify karny k lye zaroori h k wo dono list(list ko yahan wo json bol raha h) form me hon.
# Q: agar ham ny ENTRYPOINT define kar dya h, or runtime par hame ENTRYPOINT bhi change karna h to kya karen?
# A: docker run --entrypoint command image_name perameter(n)

--link 
# create a link between two cantainers. so one of them access data of other
docker run -d --name=db mysql
docker run -d --name=ubuntu --link db:db ubuntu
# Note: in --link the <db:db> is equal to <db>, so type whatever you want.

#------------------------------------------------ docker-compose
# see /home/amir/github/Notes/PNG_Notes/image_4.png
# jab hamary pas more than one containers hoty hen jo 1 dusry par dependent hoty hen, to ham aasani k lye un sary cantainers ki info 1 docker-compose.yml file me likh kar us file ko run kar dety hen.
cat > docker-compose.yml

cantainer_1_Name:
	image:
		image_1_Name:
    links:
    	- cantainer_3_Name # is cantainer ka link container_3 sy hen
cantainer_2_Name:
	image:
		image_2_Name:
 	ports:
		- 5000:8080
    links:
    	- cantainer_3_Name # is cantainer ka link container_3 sy hen
cantainer_3_Name:
	image:
		image_3_Name:
	ports:
		- 5010:8878

and then run this file by:
> docker-compose up

# Note: zaroori nahi h k docker-compose me likhy hwy sary cantainers hamary pas pehly sy bany hwy hon, agar esa ho k hamary pas 1 folder me app rakhi hwi h magar abhi tak ham ny us app ka cantainer nahi banaya h to zaroori nahi ham pehly manually us ka cantainer banaen or phir usy docker-compose.yml me likhen, instead ham ye kar sakty hen k <image> line ko <build> line sy replace kar den gy, or us directory ka path de den gy jahan hamari app and Dockerfile rakhi hwi h, eg:
before> image: image_name
after > build: ./my_app_directory



# docker-compose.yml k abhi tak 3 versions aa chuky hen, jo oopar ham nydekha wo verions1 tha, version 2 or version 1 me ye diffrences hen:
# v2 me <links> ki zaroorat nahi h. (in v1 docker-compose attaches all the cantainers to the default bridged network, and then use links to enable compunication between the cantainers. in V2 docker-compose automaticaly creates dedicated bridged network for this application, and then attaches all cantainers to that new network, all cantainers are then able to compunicate to each other using each others services names, so we dont need to use <-links> in V2.)
# v1 me dependency nahi configure ho sakti k jab tak falan cantainer na chaly tab tak falan cantainer na chalao. v2, and v3 me ye configer kar sakty hen. (jo cantainer depended ho us k andar 1 pair likh len: depends_on: - x_container_name)
# v2 or v3 ki start line ye ho gi : <version: version_number>
# v2 or V3 ki second line ye ho gi: <services:> , or jo kuch version one me tha wo sara k block k andar aa jata h.


# ------ networks in V3
# agar hame ye karna h k hamari application k kuch containers backend network use karen, kuch frontend and kuch both to ham <services> k block sy bahir aa kar ye:
networks:
	font-end:
	back-end:
# likhen gy, or phir har cantainer me 1 pair add karen gy, us ki key <networks> ho gi, and value/s front-end ya back-end ye dono alag alag line me ho ga. see /home/amir/github/Notes/PNG_Notes/image_5.png
#------------------------------------------------ 


#----------------- Docker Engine
# when you install Docker on a linux host you're actually installing three diffrent compenents:
1- Docker Deamon
2- Rest application
3- Docker CLI
