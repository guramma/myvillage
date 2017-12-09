FROM frolvlad/alpine-oraclejdk8

COPY target/Village-0.0.1-SNAPSHOT.jar /village-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "/village-0.0.1-SNAPSHOT.jar"]