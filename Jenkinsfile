#!groovy

node ('docker-cloud') {
    try {

        stage('checkout'){
            checkout scm
        }

        stage('build-java'){
            gradle 'clean build -x test'
        }

        stage('build-docker'){
            docker 'build .'
        }

        stage('deploy'){
            docker 'run -p 9080:9080 play_with_pipes:latest'

//            java '-jar /home/vagrant/release/default/play_with_pipes-1.0-SNAPSHOT.jar > app.log &'
        }

    } catch (err){

        stage('send notification'){
            echo "error occurred: ${err}"
//            mail body: "project build error: ${err}" ,
//                    from: 'xxxx@yyyy.com',
//                    replyTo: 'yyyy@yyyy.com',
//                    subject: 'project build failed',
//                    to: 'zzzz@yyyyy.com'
        }

        throw err
    }

}

def gradle(args) {
    String gradleExecutablePath = tool('gradle30');
    sh "${gradleExecutablePath} ${args}"
}

def docker(args) {
    String dockerExecutablePath = tool('docker.io');
    sh "${dockerExecutablePath} ${args}"
}

//def java(args) {
//    String javaExecutablePath = tool('java8');
//    sh "${javaExecutablePath} ${args}"
//}