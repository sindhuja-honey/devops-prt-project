pipeline {
    agent any

    environment {
        IMAGE_NAME = "sindhujalakshmi/online-learning-platform"
    }

    stages {

        stage('Pull Code') {
            steps {
                echo 'Code already checked out by Jenkins SCM'
            }
        }

        stage('Unit Test') {
            steps {
                sh '''
                if [ -f index.html ]; then
                    echo "index.html found"
                else
                    echo "index.html not found"
                    exit 1
                fi
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

    post {
        success {
            echo 'Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check console output.'
        }
    }
}
