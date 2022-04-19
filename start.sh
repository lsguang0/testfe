if [ ! "$(docker ps -q -f name=abcd)" ]; then
    echo 'not testfe run'
    if [ "$(docker ps -aq -f status=exited -f name=abcd)" ]; then
        # cleanup
        echo 'docker stop '
        docker rm abcd
    fi
    docker rmi testfe
    docker build -t testfe .
    # run your container
    docker run -itd --name abcd -p 8002:80 testfe
fi