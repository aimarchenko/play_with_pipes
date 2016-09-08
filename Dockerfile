FROM java:8-jdk
COPY build/libs/play_with_pipes-1.0-SNAPSHOT.jar /app/
EXPOSE 9080
WORKDIR /app
CMD /bin/bash -c 'java -jar play_with_pipes-1.0-SNAPSHOT.jar'