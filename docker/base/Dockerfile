FROM gradle:4.8-jdk8-slim
USER root
ARG KAFKA_VERSION=0.11.0.0
ARG CC_VERSION=2.0.37
ARG KAFKA_BIN=https://archive.apache.org/dist/kafka/0.11.0.0/kafka_2.11-${KAFKA_VERSION}.tgz
ARG SERVICE_USER=gradle
ARG SOURCE_CC_PATH=tmp
ENV SERVICE_USER ${SERVICE_USER}
RUN wget ${KAFKA_BIN}
RUN tar -zxvf kafka_2.11-${KAFKA_VERSION}.tgz
RUN mv -v /home/${SERVICE_USER}/kafka_2.11-${KAFKA_VERSION} \
    /home/${SERVICE_USER}/kafka-current
COPY ${SOURCE_CC_PATH} /home/${SERVICE_USER}/cruise-control
RUN cd /home/${SERVICE_USER}; rm -rf kafka_2.11-${KAFKA_VERSION}.tgz
RUN cd /home/${SERVICE_USER}; rm -rf ${CC_VERSION}.tar.gz
RUN cd /home/${SERVICE_USER}/cruise-control; ./gradlew jar
RUN cp /home/${SERVICE_USER}/cruise-control/cruise-control-metrics-reporter/build/libs/cruise-control-metrics-reporter-${CC_VERSION}.jar \
    /home/${SERVICE_USER}/kafka-current/libs
