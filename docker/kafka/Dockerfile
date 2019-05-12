FROM gradle:4.8-jdk8-slim
USER root
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY configs/server.properties /
ARG KAFKA_VERSION=0.11.0.0
ARG CC_VERSION=2.0.37
ENV KAFKA_VERSION $KAFKA_VERSION
RUN wget https://archive.apache.org/dist/kafka/0.11.0.0/kafka_2.11-${KAFKA_VERSION}.tgz
RUN tar -zxvf kafka_2.11-${KAFKA_VERSION}.tgz
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates
RUN git clone -b ${CC_VERSION} https://github.com/linkedin/cruise-control.git
RUN cd /home/gradle/cruise-control; ./gradlew jar
RUN cp /home/gradle/cruise-control/cruise-control-metrics-reporter/build/libs/cruise-control-metrics-reporter-${CC_VERSION}.jar \
    /home/gradle/kafka_2.11-${KAFKA_VERSION}/libs
RUN cd /home/gradle; rm -rf kafka_2.11-${KAFKA_VERSION}.tgz
RUN cd /home/gradle; rm -rf cruise-control-${CC_VERSION}
RUN cd /home/gradle; rm -rf ${CC_VERSION}.tar.gz
EXPOSE 9092
ENTRYPOINT [ "/entrypoint.sh" ]
