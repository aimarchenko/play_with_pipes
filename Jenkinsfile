#!groovy

stage 'build'
node ('docker-cloud') {
    step 'checkout from git'
    checkout scm
    step 'gradle building'
    gradle 'clean build -x test'
}

stage 'deploy'
node ('docker-cloud') {
    step 'start app'
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