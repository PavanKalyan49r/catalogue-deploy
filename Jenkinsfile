pipeline {
    agent {
        node{
            label 'AGENT-1'
        }
    }
    // environment {
    //    packageVersion =''
    //    nexusUrl = '172.31.29.16:8081'
    // }
    options {
        timeout(time:1, unit: 'HOURS')
        disableConcurrentBuilds()
    }
    parameters {
        string(name: 'version', defaultValue: '1.0.0', description: 'what is the artifact version?')
        string(name: 'environment', defaultValue: 'dev', description: 'what is the environment?')
    }
// build
    stages {
        stage('print version') {
            steps {
                sh """
                   echo "version: ${params.version}"
                   echo "environment: ${params.environment}"
                """
            }
        }
    }
    //post build
    post {
        always{
            echo 'i will always say hello again'
            deleteDir()
        }
        failure{
            echo 'this runs when pipeline is failed, used generally to send some alrets'
        }
        success{
            echo 'i will say hello when pipeline is success'
        }
    }
}