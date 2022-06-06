FROM localstack/localstack-full:0.13.3

ENV SERIVICES=s3
ENV EDGE_BIND_HOST=0.0.0.0
ENV EDGE_PORT=4566
ENV DOCKER_HOST=unix:///var/run/docker.sock
ENV DATA_DIR=/opt/code/localstack/data
ENV DISABLE_CORS_CHECKS=1

RUN echo "alias aws=awslocal" >> ~/.bashrc
COPY ./init/* /docker-entrypoint-initaws.d
