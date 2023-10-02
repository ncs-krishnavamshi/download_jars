pipeline {
    agent any
    parameters {
        choice(name: 'promote', choices: ['SNYPR', 'RIN', 'RIN-Upgrade'], description: 'Promote to:')
        string(name: 'version', defaultValue: '', description: 'Enter the required version')
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws')
        AWS_SECRET_ACCESS_KEY = credentials('aws')
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    def checkoutBranch = params.promote == 'RIN' ? 'rin-branch' :
                                        params.promote == 'RIN-Upgrade' ? 'rin-upgrade-branch' : 'main'
                    checkout([$class: 'GitSCM',
                              branches: [[name: checkoutBranch]],
                              doGenerateSubmoduleConfigurations: false,
                              extensions: [[$class: 'CleanCheckout'],
                                           [$class: 'CloneOption', noTags: false, shallow: true, timeout: 2],
                                           [$class: 'PruneStaleBranch']],
                              submoduleCfg: [],
                              userRemoteConfigs: [[credentialsId: 'github', url: 'git@github.com:omeshvalyal/download_jars.git']]])
                }
            }
        }
        stage('Run command') {
            steps {
                sh 'echo "Welcome to Jenkins"'
            }
        }
        stage('Promote the files') {
            steps {
                script {
                    sh '''
                    chmod 775 /var/lib/jenkins/workspace/krishnavamshi/copy2.sh
                    /var/lib/jenkins/workspace/krishnavamshi/copy2.sh ${params.promote} ${params.version}
                    '''
                }
            }
        }
    }
}
