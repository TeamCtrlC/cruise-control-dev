FROM gradle:4.8-jdk8-slim
ARG VERSION=2.0.37
USER root
COPY configs/cruisecontrol.properties /
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates
RUN git clone -b ${VERSION} https://github.com/linkedin/cruise-control.git
RUN cd /home/gradle/cruise-control; gradle jar copyDependantLibs
EXPOSE 8090
ENTRYPOINT [ "/entrypoint.sh" ]
