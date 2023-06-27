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
            sh 'cd nodeapp && sudo docker build . -t 857269734878.dkr.ecr.us-east-1.amazonaws.com/assignment:${BUILD_NUMBER}'
            sh 'sudo docker push 857269734878.dkr.ecr.us-east-1.amazonaws.com/assignment:${BUILD_NUMBER}'
        }
    }

  }
  environment {
    AWS_DEFAULT_REGION = 'us-east-1'
  }
  post {
    always {
      deleteDir()
      sh 'sudo docker 857269734878.dkr.ecr.us-east-1.amazonaws.com/assignment:${BUILD_NUMBER}'
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