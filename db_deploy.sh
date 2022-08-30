#!/bin/bash

docker stop $(docker ps -a -q)
docker run -d -p 3306:3306 brainbackdoor/data-subway:0.0.1
