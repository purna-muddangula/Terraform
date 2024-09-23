pipeline {
    agent any

    environment {
        AWS_CREDENTIALS_ID = 'aws-credentials'  // Replace with your credentials ID
        TF_VERSION = '1.5.6'  // Specify Terraform version
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from the Git repository
                git branch: 'main', url: 'https://github.com/purna-muddangula/Terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                        sh '''
                            terraform --version
                            terraform init
                        '''
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                        sh '''
                            terraform plan -out=tfplan
                        '''
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                        sh '''
                            terraform apply -auto-approve tfplan
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean up the workspace
        }
    }
}
