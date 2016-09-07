#!groovy

stage 'Dev'
node ('docker-cloud') {
    sh 'env';
    checkout scm
    gradle 'clean build -x test'
    java '-jar ./build/libs/play_with_pipes-1.0-SNAPSHOT.jar > app.log'
}

def gradle(args) {
    String gradleExecutablePath = tool('gradle30');
    sh "${gradleExecutablePath} ${args}"
}

def java(args) {
    String javaExecutablePath = tool('java8');
    sh "${javaExecutablePath} ${args}"
}