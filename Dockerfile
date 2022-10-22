FROM minio/minio:latest

ENV PATH=/opt/bin:$PATH

RUN ["curl", "-O", "https://dl.min.io/server/minio/release/linux-amd64/minio"]
COPY ./minio /opt/bin/minio
RUN chmod +x /opt/bin/minio/minio

COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

VOLUME ["/data"]

CMD ["minio", "server", "/data"]
