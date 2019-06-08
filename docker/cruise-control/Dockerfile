FROM ctrl-c:cc-base
USER root
ARG SERVICE_USER=gradle
ARG SOURCE_CC_PATH=tmp
ARG TARGET_CC_PATH=/home/${SERVICE_USER}/cruise-control
ENV SERVICE_USER ${SERVICE_USER}
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN rm -rf /home/${SERVICE_USER}/cruise-control
COPY ${SOURCE_CC_PATH} ${TARGET_CC_PATH}
RUN cp /home/${SERVICE_USER}/cruise-control/config/cruisecontrol.properties /
RUN cd /home/${SERVICE_USER}/cruise-control; ./gradlew jar
EXPOSE 8090
ENTRYPOINT [ "/entrypoint.sh" ]
