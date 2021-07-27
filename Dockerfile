FROM centos:7 as junk
RUN yum install java-1.8.0 -y
RUN yum install git -y
RUN yum -y install maven
RUN git clone https://github.com/ravi2krishna/JavaWeb.git
#RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
WORKDIR /JavaWeb
RUN mvn package


FROM tomcat
COPY --from=junk /JavaWeb/target/WebAppCal-0.0.6.war /usr/local/tomcat/webapps
EXPOSE 8080
