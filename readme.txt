pipeline {
 agent any
 stages {
 stage('Checkout') {
 steps {
 git 'https://github.com/AdrianBallesteros/jenkins'
 }
 }
 stage('Build') {
 steps {
 sh './build.sh' // o 'mvn package', 'npm install', etc.
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
