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
        ansiColor('xterm')
    }
    parameters {
        string(name: 'version', defaultValue: '', description: 'what is the artifact version?')
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

        stage('init') {
            steps{
                sh """
                   cd terraform
                   terraform init --backend-congif=${params.environment}/backend.tf -reconfigure
                """
            }
        }
         stage('plan') {
            steps{
                sh """
                   cd terraform
                   terraform plan -var-file=${params.environment}/${params.environment}.tfvars
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