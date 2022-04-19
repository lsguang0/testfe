FROM nginx
MAINTAINER testfe
COPY my.conf /etc/nginx/nginx.conf
COPY dist /home/ubuntu/project/felog/fe/dist
