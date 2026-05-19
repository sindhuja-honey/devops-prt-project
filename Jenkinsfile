pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git 'YOUR_GITHUB_REPO_LINK'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t prt-nginx .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 80:80 prt-nginx'
            }
        }
    }
}
