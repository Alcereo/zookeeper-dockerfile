FROM centos:7

LABEL description="Zookeeper 3.4.11. \
- KUCHEEV A.P. \
"

RUN yum install -y java-1.8.0-openjdk && \
yum clean all && \
rm -rf /var/cache/yum


ADD ./files /

RUN tar -xf /zookeeper-3.4.11.tar.gz && \
rm -rf /zookeeper-3.4.11.tar.gz; \
chmod +x /entrypoint.sh && \
cp /zoo.properties /zookeeper-3.4.11/conf/zoo.cfg


ENV ZK_DIR="/zookeeper-3.4.11"


CMD ["/entrypoint.sh"]