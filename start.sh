if [ ! "$(docker ps -q -f name=testfe)" ]; then
    echo 'not testfe run'
    if [ "$(docker ps -aq -f status=exited -f name=testfe)" ]; then
        # cleanup
        echo 'docker stop '
        docker rm testfe
    fi
    docker build -t testfe --no-cache.
    # run your container
    docker run -itd --name testfe -p 8002:80 -v /home/ubuntu/project/felog/my.conf:/etc/nginx/conf.d -v /home/ubuntu/project/felog/dist:/usr/share/nginx/html/ testfe
fi