FROM ctrl-c:cc-base
USER root
ARG SERVICE_USER=gradle
ARG SOURCE_CC_PATH=tmp
ARG TARGET_CC_PATH=/home/${SERVICE_USER}/cruise-control-new
ENV SERVICE_USER ${SERVICE_USER}
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY ${SOURCE_CC_PATH} ${TARGET_CC_PATH}
RUN rsync -auv ${TARGET_CC_PATH} /home/${SERVICE_USER}/cruise-control
RUN cp /home/${SERVICE_USER}/cruise-control/config/cruisecontrol.properties /
RUN cd /home/${SERVICE_USER}/cruise-control; ./gradlew build -x test
EXPOSE 8090
ENTRYPOINT [ "/entrypoint.sh" ]
