FROM ubuntu:latest

 
RUN apt-get update  -y
RUN apt-get upgrade -y

#RUN  add-apt-repository ppa:openjdk-r/ppa

RUN apt-get install -y openjdk-8-jdk



RUN apt-get install -y wget


# unpack java

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH



RUN apt-get clean

RUN wget --no-verbose -O /tmp/apache-maven-3.3.9.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

RUN tar xzf /tmp/apache-maven-3.3.9.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.3.9 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.3.9.tar.gz
ENV MAVEN_HOME /opt/maven
ENV PATH $MAVEN_HOME/bin:$PATH


RUN apt-get clean

RUN apt-get update 
RUN apt-get install -y libgconf2-4 
RUN apt-get install -y libnss3
RUN apt-get install -y libxss1
RUN apt-get install -y fonts-liberation
RUN apt-get install -y libgtk-3-0
RUN apt-get install -y lsb-release
RUN apt-get install -y xdg-utils
RUN apt-get install -y libappindicator3-1

RUN rm -r /var/lib/apt/lists/*
RUN apt-get clean
RUN apt-get update



RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
RUN apt-get install -f

EXPOSE 80


WORKDIR "/DockerSelenium"

ENTRYPOINT ["/bin/bash"]

