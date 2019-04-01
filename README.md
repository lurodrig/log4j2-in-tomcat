# log4j2-in-tomcat

## What?
Apache Tomcat image with the spring-boot hello world REST example both configured to use log4j2. See all details at [Keeping your logs clean with Apache Tomcat 9, log4j2 and spring-boot](https://db-blog.web.cern.ch/blog/luis-rodriguez-fernandez/2019-03-keeping-your-logs-clean-apache-tomcat-9-log4j2-and-spring-boot)

## Prerequisites

### Java
```bash
   java version "1.8.0_191"
   Java(TM) SE Runtime Environment (build 1.8.0_191-b12)
   Java HotSpot(TM) 64-Bit Server VM (build 25.191-b12, mixed mode)
```

### Maven
```bash
   Apache Maven 3.6.0
```

### Docker
```bash
   Docker version 18.09.3, build 774a1f4
```

## Usage

1. Compile build and package the spring-boot application: `mvn clean package`
2. Build the docker image: `docker build -t 9.0.16-jre8-log4j2 .`
3. Run the resulting container: `docker run -p 8080:8080 --name test-tomcat-log4j2 9.0.16-jre8-log4j2`

Or just run the [run-test-tomcat-log4j2.sh](run-test-tomcat-log4j2.sh). 

With the provided configuration the docker output should be quite silent, if not [shout me](https://github.com/lurodrig/log4j2-in-tomcat/issues/new)!!! ;). If you want to have a look at the apache tomcat log run `docker exec -it test-tomcat-log4j2 tail -f logs/catalina.log` If you want to see details in the console aobut the log4j2 configuration set `<Configuration status="debug">` in [log4j2-tomcat.xml](log4j2-tomcat.xml). 

## License

[GNU GENERAL PUBLIC LICENSE](https://www.gnu.org/licenses/gpl-3.0.en.html)

