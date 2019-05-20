FROM gradle:4.8-jdk8-slim
USER root
ARG KAFKA_VERSION=0.11.0.0
ARG KAFKA_BIN=https://archive.apache.org/dist/kafka/0.11.0.0/kafka_2.11-${KAFKA_VERSION}.tgz
ARG SERVICE_USER=gradle
ARG SOURCE_CC_PATH=tmp
ARG TARGET_CC_PATH=/home/${SERVICE_USER}/cruise-control
ENV SERVICE_USER ${SERVICE_USER}
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates
RUN wget ${KAFKA_BIN}
RUN tar -zxvf kafka_2.11-${KAFKA_VERSION}.tgz
RUN mv -v /home/${SERVICE_USER}/kafka_2.11-${KAFKA_VERSION} \
    /home/${SERVICE_USER}/kafka-current
COPY ${SOURCE_CC_PATH} ${TARGET_CC_PATH}
RUN cd /home/${SERVICE_USER}; rm -rf kafka_2.11-${KAFKA_VERSION}.tgz
RUN cd /home/${SERVICE_USER}; rm -rf *.tar.gz
RUN cd ${TARGET_CC_PATH}; ./gradlew jar
RUN cp ${TARGET_CC_PATH}/cruise-control-metrics-reporter/build/libs/cruise-control-metrics-reporter-*.jar \
    /home/${SERVICE_USER}/kafka-current/libs
RUN cd ${TARGET_CC_PATH}; ./gradlew build -x test
