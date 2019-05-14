FROM ctrl-c:cc-base
USER root
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENV SERVICE_USER gradle
EXPOSE 2181 2888 3888
ENTRYPOINT [ "/entrypoint.sh" ]
