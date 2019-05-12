FROM gradle:4.8-jdk8-slim
USER root
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ARG VERSION=0.11.0.0
ENV VERSION $VERSION
RUN wget https://archive.apache.org/dist/kafka/0.11.0.0/kafka_2.11-${VERSION}.tgz
RUN tar -zxvf kafka_2.11-${VERSION}.tgz
RUN rm -rf kafka_2.11-${VERSION}.tgz
EXPOSE 2181 2888 3888
ENTRYPOINT [ "/entrypoint.sh" ]
