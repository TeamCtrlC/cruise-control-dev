FROM ctrl-c:cc-base
USER root
ARG SERVICE_USER=gradle
ENV SERVICE_USER ${SERVICE_USER}
COPY configs/cruisecontrol.properties /
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN cd /home/${SERVICE_USER}/cruise-control; gradle jar copyDependantLibs
EXPOSE 8090
ENTRYPOINT [ "/entrypoint.sh" ]
