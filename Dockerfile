FROM tomcat:9.0.16-jre8

# VARIABLES
#ARG log4j2_version

# Following https://logging.apache.org/log4j/2.x/log4j-appserver/index.html
# Create directories
RUN mkdir -pv $CATALINA_HOME/log4j2/lib
RUN mkdir -pv $CATALINA_HOME/log4j2/conf

# Download api and core libraries $CATALINA_HOME/log4j2/lib has to be added to the CLASSPATH
RUN curl -o $CATALINA_HOME/log4j2/lib/log4j-api-2.11.2.jar https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.11.2/log4j-api-2.11.2.jar 
RUN curl -o $CATALINA_HOME/log4j2/lib/log4j-core-2.11.2.jar https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.11.2/log4j-core-2.11.2.jar
# Download appserver library. This one replaces the old log4j "extras" one
RUN curl -o $CATALINA_HOME/log4j2/lib/log4j-appserver-2.11.2.jar https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-appserver/2.11.2/log4j-appserver-2.11.2.jar
# Log4j JDK Logging Adapter. Allow apps to use java.util.logging via log4j2 
RUN curl -o $CATALINA_HOME/log4j2/lib/log4j-jul-2.11.2.jar https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-jul/2.11.2/log4j-jul-2.11.2.jar 

# Copy the log4j2-tomcat.xml in $CATALINA_HOME/log4j2/conf
ADD log4j2-tomcat.xml $CATALINA_HOME/log4j2/conf/log4j2.xml

# Add libraries and conf file to the CLASSPATH
ADD setenv.sh $CATALINA_HOME/bin

# Remove the $CATALINA_HOME/conf/logging.properties, if not you are cheating ;)
RUN rm $CATALINA_HOME/conf/logging.properties

# Our context.xml will redirect all the System.out and System.err to catalina.log
ADD context.xml $CATALINA_HOME/conf/context.xml

# Add the spring web services "hello, world!" application to test the logging configuration.
# Taken from https://spring.io/guides/gs/actuator-service/
ADD target/gs-actuator-service-0.1.0.war.original $CATALINA_HOME/webapps/sample.war
