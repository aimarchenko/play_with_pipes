#!groovy

stage 'Dev'
node ('docker-cloud') {
    checkout scm
    gradle 'clean build -x test'
    dir('target') {stash name: 'war', includes: 'x.war'}
}

def gradle(args) {
    sh "usr/bin/gradle ${args}"
}