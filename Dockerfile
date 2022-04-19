FROM nginx
ADD ./my.conf /etc/nginx/conf.d
ADD ./dist /usr/share/nginx/html/
ADD /home/ubuntu/project/logs /var/log/nginx/