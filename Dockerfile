FROM tomcat:9.0
RUN apt-get update
RUN apt-get install openjdk-11-jdk -y
WORKDIR demo
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz
RUN tar -x -v -f apache-tomcat-9.0.96.tar.gz
COPY Amazon.war /usr/local/tomcat/demo/apache-tomcat-9.0.96/webapps/
EXPOSE 8080
CMD [“/usr/local/tomcat/demo/apache-tomcat-9.0.96/bin/catalina.sh”,”run”]

