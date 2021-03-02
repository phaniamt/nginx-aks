FROM ubuntu:16.04
RUN apt-get update
RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get update && add-apt-repository ppa:nginx/stable
RUN apt-get update && apt-get install -y iputils-ping
RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y vim
RUN apt-get update && \
    apt-get -y install nginx
COPY nginx.conf /etc/nginx/nginx.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
COPY virtual-hosts.com /etc/nginx/sites-available/virtual-hosts.com
RUN ln -s /etc/nginx/sites-available/virtual-hosts.com /etc/nginx/sites-enabled/virtual-hosts.com
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
