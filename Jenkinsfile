pipeline {
     
     environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_NAME = 'nahhla0220/nginx'
        AWS_ACCESS_KEY_ID = credentials('access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('secret-access-key-id')
        KUBECONFIG = credentials('kubeconfig')
        NAMESPACE = "${env.BRANCH_NAME == 'prod' ? 'prod' : 'dev'}"
    }
  agent any

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
                    // Use the kubeconfig stored as a Jenkins credential
                        withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {

                        // Apply the Kubernetes deployment and service YAML files
                        sh """
                        kubectl apply -f kubenates/${NAMESPACE}/frontend-deployment.yml   -n ${NAMESPACE}
                        kubectl apply -f kubenates/${NAMESPACE}/frontend-service.yml      -n ${NAMESPACE}
                        kubectl apply -f kubenates/${NAMESPACE}/backend-deployment.yml    -n ${NAMESPACE}
                        kubectl apply -f kubenates/${NAMESPACE}/backend-service.yml       -n ${NAMESPACE} 
                        kubectl apply -f kubenates/${NAMESPACE}/loadbalancer-service.yml   -n ${NAMESPACE} 
                        """
                    }
                }
            }
    
        }
}
}

   
        