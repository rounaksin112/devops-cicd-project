pipeline {
    agent any

    stages {

        stage('Maven Test') {
            steps {
                sh 'mvn -f application/pom.xml test'
            }
        }

        stage('Maven Package') {
            steps {
                sh 'mvn -f application/pom.xml clean package'
            }
        }

    }
}
