FROM minio/minio:latest

ENV PATH=/opt/bin:$PATH

RUN curl
RUN ["curl", "-o", "/opt/bin/minio", "https://dl.min.io/server/minio/release/linux-amd64/minio"]
RUN chmod +x /opt/bin/minio/minio

COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

VOLUME ["/data"]

CMD ["minio", "server", "/data"]
