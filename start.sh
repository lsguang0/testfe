if [ "$(docker ps -q -f name=fe)" ]; then
    docker stop fe    
    docker rm fe
    docker rmi testfe
fi
if [ "$(docker ps -aq -f status=exited -f name=fe)" ]; then
    docker rm fe
    docker rmi testfe
fi
docker build -t testfe .
docker run -itd --restart=always \
-v /home/ubuntu/project/felogs:/var/log/nginx \
-v /home/ubuntu/project/testfe/nginx:/etc/nginx/conf.d \
-v /home/ubuntu/project/testfe/dist:/usr/share/nginx/html \
--name fe  -p 3000:80 testfe