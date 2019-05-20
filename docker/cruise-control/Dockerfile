FROM ctrl-c:cc-base
USER root
ARG SERVICE_USER=gradle
ENV SERVICE_USER ${SERVICE_USER}
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN cp /home/${SERVICE_USER}/cruise-control/config/cruisecontrol.properties /
RUN cd /home/${SERVICE_USER}/cruise-control; gradle jar copyDependantLibs
EXPOSE 8090
ENTRYPOINT [ "/entrypoint.sh" ]
