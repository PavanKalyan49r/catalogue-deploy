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
        stage('install dependencies') {
            steps {
                sh """
                   npm install
                """
            }
        }
        stage('build') {
            steps {
                sh """
                ls -la
                zip -q -r catalogue.zip ./* -x ".git" -x "*.zip"
                ls -ltr
                """
            }
        }
        stage('publish artifact') {
            steps {
                nexusArtifactUploader(
                   nexusVersion: 'nexus3',
                   protocol: 'http',
                   nexusUrl: "${nexusUrl}",
                   groupId: 'com.roboshop',
                   version: "${packageVersion}",
                   repository: 'catalogue',
                   credentialsId: 'nexus-auth',
                     artifacts: [
                            [artifactId: 'catalogue',
                            classifier: '',
                            file: 'catalogue.zip',
                            type: 'zip']
                                ]
                )
            }
        }
        stage('DEPLOY') {
            steps {
                sh """ 
                   echo "HERE i wrote shell "
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