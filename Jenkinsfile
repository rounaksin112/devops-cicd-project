cat > Jenkinsfile <<'EOF'
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

        stage('Docker Build') {
            steps {
                sh 'docker build -t rounak123/devops-cicd-app:1.0 .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKERHUB_USERNAME',
                    passwordVariable: 'DOCKERHUB_TOKEN'
                )]) {
                    sh '''
                        echo "$DOCKERHUB_TOKEN" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin
                        docker push rounak123/devops-cicd-app:1.0
                        docker logout
                    '''
                }
            }
        }

    }
}
EOF
