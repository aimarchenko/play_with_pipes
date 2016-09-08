#!groovy


stage name: 'build'
node ('docker-cloud') {
    echo 'git checkout'
    checkout scm
    echo 'gradle building'
    gradle 'clean build -x test'
}

stage name: 'deploy'
node ('docker-cloud') {
    echo 'start app'
    java '-jar ./build/libs/play_with_pipes-1.0-SNAPSHOT.jar > app.log &'
}

def gradle(args) {
    String gradleExecutablePath = tool('gradle30');
    sh "${gradleExecutablePath} ${args}"
}

def java(args) {
    String javaExecutablePath = tool('java8');
    sh "${javaExecutablePath} ${args}"
}