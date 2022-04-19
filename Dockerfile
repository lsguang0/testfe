FROM nginx
MAINTAINER testfe
COPY my.conf /etc/nginx/nginx.conf
COPY dist /usr/share/nginx/html/dist
