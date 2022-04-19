FROM nginx
MAINTAINER testfe
ADD my.conf /etc/nginx/conf.d
ADD /home/ubuntu/project/felog/dist /usr/share/nginx/html/
ADD /home/ubuntu/project/logs /var/log/nginx/