pipeline {
    agent any 
    stages {
        stage('Checkout') {
            steps {
              git branch: 'main', credentialsId: 'github', url: 'git@github.com:omeshvalyal/download_jars.git'                  
            }
        }
        stage('Run command') {
            steps {
              sh 'echo "welcome to jenkins"'                  
            }
        }
    }
}
