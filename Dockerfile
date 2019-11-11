FROM ubuntu
MAINTAINER pkasela

ENV SPARK_VER=2.4.4
ENV HADOOP_VER=2.6
ENV POLYNOTE_VER=0.2.11

RUN apt-get update
RUN apt install -y openjdk-8-jdk openjdk-8-jre

RUN cd
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

RUN apt install -y python3 scala python3-pip wget
RUN pip3 install --upgrade pip
RUN pip3 install py4j==0.10.7
RUN pip3 install jupyter pandas numpy matplotlib keras jep virtualenv jedi pyspark
RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-hadoop${HADOOP_VER}.tgz
RUN tar -xvf spark-${SPARK_VER}-bin-hadoop${HADOOP_VER}.tgz
RUN mv spark-${SPARK_VER}-bin-hadoop${HADOOP_VER} /opt/spark

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
ENV PYSPARK_ALLOW_INSECURE_GATEWAY=1
 
RUN wget https://github.com/polynote/polynote/releases/download/${POLYNOTE_VER}/polynote-dist.tar.gz | bash
RUN tar -zxvpf polynote-dist.tar.gz

EXPOSE 8192
EXPOSE 4040
EXPOSE 8888

RUN cd /polynote/
COPY config.yml /polynote/config.yml

RUN mkdir -p /polynote/notebooks/notebook_ext

ENTRYPOINT bash /polynote/polynote

