FROM ubuntu:latest
RUN apt update && apt install -y git && apt install -y nginx
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/
#RUN mkdir -p /etc/nginx/sites-enabled/default
RUN sed -i 's/80 default_server/8080 default_server/g' /etc/nginx/sites-enabled/default
EXPOSE 8080
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
