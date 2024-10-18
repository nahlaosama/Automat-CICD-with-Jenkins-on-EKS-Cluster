pipeline {
    agent any
    
    environment {
        // Define Docker Hub credentials
        DOCKER_HUB_CREDENTIALS = credentials('nahla-id')
        IMAGE_NAME = 'nahhla0220/nginx'
        KUBECONFIG = '/path/to/your/kubeconfig'
    }
    

    stages {
        stage('Build') {
            steps {
                script {
                    // Log in to Docker Hub using the credentials
                    sh "echo \$DOCKER_HUB_CREDENTIALS_PSW | docker login -u \$DOCKER_HUB_CREDENTIALS_USR --password-stdin"
                    // Build the Docker image
                    sh 'docker build -t nahhla0220/nginx:v1 .'
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    
                    // Push the image to Docker Hub
                    sh 'docker push nahhla0220/nginx:v1'
                    
                    // Remove the image after pushing
                    sh 'docker rmi nahhla0220/nginx:v1'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Pull the pushed image from Docker Hub
                    sh 'docker pull nahhla0220/nginx:v1'
                    
                    // Run the container and expose it on port 80
                    sh 'docker run -d -p 80:80 nahhla0220/nginx:v1'
                }
            }
        }
    }
