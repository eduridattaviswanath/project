FROM tomcat:7.0.57-jre8
COPY ./target/WebAppCal-1.3.5.war /usr/local/tomcat/webapps
#testing jenkins webhook
