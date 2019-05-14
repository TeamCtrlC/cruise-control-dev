FROM ctrl-c:cc-base
USER root
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY configs/server.properties /
ARG SERVICE_USER=gradle
ENV SERVICE_USER ${SERVICE_USER}
EXPOSE 9092
ENTRYPOINT [ "/entrypoint.sh" ]
