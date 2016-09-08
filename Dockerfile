FROM java:8-jdk

ADD ./build/libs/play_with_pipes-1.0-SNAPSHOT.jar /app/
ENTRYPOINT ["java", "-Xmx200m", "-jar", "/app/play_with_pipes-1.0-SNAPSHOT.jar"]