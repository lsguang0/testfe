if [ "$(docker ps -q -f name=fe)" ]; then
    echo 'not fe run'
    docker rm fe
    docker rmi testfe

    # run your container
fi
if [ "$(docker ps -aq -f status=exited -f name=fe)" ]; then
    # cleanup
    echo 'docker stop '
    docker rm fe
    docker rmi testfe
fi
docker build -t testfe .
docker run -itd --restart=always \
-v /home/ubuntu/project/felogs:/var/log/nginx \
-v /home/ubuntu/project/felog/nginx:/etc/nginx/conf.d \
-v /home/ubuntu/project/felog/dist:/usr/share/nginx/html \
--name fe  -p 8002:80 testfe