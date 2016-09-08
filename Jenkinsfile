#!groovy

node ('docker-cloud') {
    try {

        stage('checkout'){
            checkout scm
        }

        stage('build-java'){
            gradle 'clean build -x test'
        }

        stage('docker-cleanup'){
            try {
                docker 'rm -f play_with_pipes'
            } catch (err){
                echo "remove container: ${err}"
            }

            try{
                docker 'rmi $(sudo docker images --format "{{.ID}} {{.Repository}}" | awk \'$2 ~ /play_with_pipes$/ { print $1 }\')'
            } catch (err){
                echo "remove image: ${err}"
            }
        }

        stage('build-docker'){
            docker 'build -t play_with_pipes .'
        }

        stage('deploy'){
            docker 'run -p 9080:9080 play_with_pipes'

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
    sh "sudo ${dockerExecutablePath} ${args}"
}

//def java(args) {
//    String javaExecutablePath = tool('java8');
//    sh "${javaExecutablePath} ${args}"
//}