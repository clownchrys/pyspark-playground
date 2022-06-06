FROM ubuntu:focal-20211006

ARG DEVIAN_FRONTEND=noninteractive

# envs
ENV TZ=Asia/Seoul
ENV HOME=/root
ENV APPLICATION_DIR=/usr/share
ENV INSTALLER_DIR=/tmp/installer
RUN mkdir -p $INSTALLER_DIR

# global config
RUN RUN echo 'root:root' | chpasswd # set root password
RUN apt -y update

# essentials
RUN apt install -y \
    net-tools \
    iputils-ping \
    zip \
    unzip \
    wget \
    curl \
    vim

# java
RUN apt install -y openjdk-8-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# jupyter
RUN apt install -y python3-pip
RUN pip3 install jupyter jupyterlab boto3 py4j pandas numpy

# envs
ENV SPARK_HOME=$APPLICATION_DIR/spark
ENV PYSPARK_PYTHON=/usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON=jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS='lab --no-browser'
ENV PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

# install
#COPY bin/spark-3.1.2-bin-hadoop3.2.tgz $INSTALLER_DIR
RUN wget https://dlcdn.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz -NP $INSTALLER_DIR
RUN tar -xvf $INSTALLER_DIR/spark-3.1.2-bin-hadoop3.2.tgz -C $APPLICATION_DIR
RUN mv $APPLICATION_DIR/spark-3.1.2-bin-hadoop3.2 $SPARK_HOME

# configure: spark
COPY config/* $SPARK_HOME/conf

# configure: jupyter
COPY .jupyter $HOME/.jupyter

# endpoint
WORKDIR $HOME
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT /docker-entrypoint.sh
