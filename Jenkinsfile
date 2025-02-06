pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = 'netro_dt_service_v2/simple-home-page'
        DOCKER_IMAGE_TAG = 'latest'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Docker 이미지 빌드
                script {
                    sh "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                // Docker Hub 또는 레지스트리에 이미지 푸시
                script {
                    sh "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
        stage('Deploy') {
            steps {
                // 기존 컨테이너 종료
                script {
                    sh 'docker ps -q --filter "ancestor=${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}" | xargs -r docker stop'
                    sh 'docker ps -q --filter "ancestor=${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}" | xargs -r docker rm'
                }
                // 새 컨테이너 시작
                script {
                    sh "docker run -d -p 8080:8080 ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
}