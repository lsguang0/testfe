FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY ./default.conf /etc/nginx/conf.d
ADD ./dist /usr/share/nginx/html/