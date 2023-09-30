pipeline {
    agent any 
        choice(name: 'promote', choices: ['SNYPR', 'RIN', 'RIN-Upgrade'], description: 'Promote to:')
        string(name: 'version', defaultValue: '', description: 'Enter the required version')
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
        stage('Promote the files') {
            steps {
             sh '''
                  chmod 700 /var/lib/jenkins/workspace/SNPR-RN/copy.sh
                  ./copy.sh
                  '''                  
            }
        }
    }
}