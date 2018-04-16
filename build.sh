#!/bin/bash

# rm kafka-1-0-1.tar

docker build -t alcereo/zookeeper:3.4.11 .

# docker save alcereo/kafka:1.0.1 -o kafka-1-0-1.tar

docker run -it alcereo/zookeeper:3.4.11
# docker run -it alcereo/zookeeper:3.4.11 /bin/bash