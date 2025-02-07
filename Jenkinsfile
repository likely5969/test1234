pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'netro_dt_backend_v2:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/likely5969/test1234.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    sh 'docker stop netro_dt_backend_v2 || true'
                    sh 'docker rm netro_dt_backend_v2 || true'
                    sh 'docker run -d -p 8080:8080 --name netro_dt_backend_v2 ${DOCKER_IMAGE}'
                }
            }
        }
    }