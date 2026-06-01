pipeline {
    agent any

    environment {
        IMAGE_NAME = "sindhujalakshmi/online-learning-platform"
    }

    stages {

        stage('Pull Code') {
            steps {
                git 'https://github.com/sindhuja-honey/devops-prt-project.git'
            }
        }

        stage('Unit Test') {
            steps {
                sh '''
                test -f index.html
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:latest .
                '''
            }
        }

        stage('Push To Docker Hub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push $IMAGE_NAME:latest
                    '''
                }
            }
        }
    }
}
