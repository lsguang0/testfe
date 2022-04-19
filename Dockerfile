FROM nginx
COPY my.conf /etc/nginx/conf.d
ADD ./dist /usr/share/nginx/html/