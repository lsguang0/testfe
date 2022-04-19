if [ ! "$(docker ps -q -f name=fe)" ]; then
    echo 'not fe run'
    if [ "$(docker ps -aq -f status=exited -f name=fe)" ]; then
        # cleanup
        echo 'docker stop '
        docker rm fe
    fi
    docker rmi testfe
    docker build -t testfe .
    # run your container
    docker run -itd --restart=always --name fe -p 8002:80 testfe
fi