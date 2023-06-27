pipeline {
  agent {
    label 'worker'
  }
  stages {
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build Docker Image') {
      steps {
            sh 'cd nodeapp && aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 857269734878.dkr.ecr.us-east-1.amazonaws.com && docker build . -t 857269734878.dkr.ecr.us-east-1.amazonaws.com/assignment:${BUILD_NUMBER}'
            sh 'docker push 857269734878.dkr.ecr.us-east-1.amazonaws.com/assignment:${BUILD_NUMBER}'
        }
    }

  }
  post {
    always {
      deleteDir()
      sh 'sudo docker rmi 857269734878.dkr.ecr.us-east-1.amazonaws.com/assignment:${BUILD_NUMBER}'
    }

  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
    disableConcurrentBuilds()
    timeout(time: 1, unit: 'HOURS')
  }
  parameters{
        string(name: 'BRANCH', defaultValue: 'develop')
        choice(name: 'ENV', choices: ['DEV','QA','PROD','ANALYST'])
        booleanParam(name: 'TEST_CASES', defaultValue: true)
    }
    triggers { 
        pollSCM "*/5 * * * *" 
        cron "0 */4 * * *" 
    }
}