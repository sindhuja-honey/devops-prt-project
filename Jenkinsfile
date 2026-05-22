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
    }
}
