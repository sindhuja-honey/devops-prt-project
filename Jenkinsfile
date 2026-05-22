pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/sindhuja-honey/mani-02.git'
            }
        }

        stage('Build Docker') {
            steps {
                sh 'docker build -t prt-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 80:80 prt-app'
            }
        }
    }
}
