#!/bin/sh


service nginx start

sleep 10

curl --retry 5 --retry-max-time 120 -v  \
     http://localhost:80/nginx_status  > $RESULT
