pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/AdrianBallesteros/jenkins'
            }
        }

        stage('Build') {
            steps {
                sh './build.sh' // Cambiar según tu entorno (maven, gradle, npm, etc.)
            }
        }

        stage('Test') {
            steps {
                sh './run_tests.sh'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
            }
        }
    }
}
