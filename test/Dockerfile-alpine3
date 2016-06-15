# Dockerfile for building image that contains software stack provisioned by Ansible.
#
# USAGE:
#   $ docker build -t nginx .
#   $ docker run -p 80:80 nginx
#
# Version  1.1
#


# pull base image
FROM williamyeh/ansible:alpine3-onbuild

MAINTAINER William Yeh <william.pjyeh@gmail.com>


#
# build phase
#

RUN apk add sudo

ENV PLAYBOOK test-alpine.yml
RUN ansible-playbook-wrapper --extra-vars "nginx_use_service=false"

EXPOSE 80


#
# test phase
#

RUN echo "===> Installing curl for testing purpose..."  && \
    apk add curl

RUN echo "===> Deploying nginx_status.conf to server for testing..."   && \
    echo -e "server {\n    listen 80;\n    listen [::]:80;\n\n    server_name _;\n\n    location /nginx_status {\n        # Turn on nginx stats\n        stub_status on;\n    }\n}"   \
    > /etc/nginx/conf.d/nginx_status.conf



VOLUME ["/data"]
ENV    RESULT     /data/result-alpine3
COPY   test/run-test-alpine.sh  /usr/local/bin/run-test.sh


CMD [ "run-test.sh" ]