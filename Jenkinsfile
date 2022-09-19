pipeline {
    triggers {
        GenericTrigger(
                genericVariables: [
                        [key: 'commit', value: '$.commits[0].id'],
                        [key: 'committer', value: '$.commits[0].committer.name'],
                        [key: 'ref', value: '$.ref']
                ],
                token: 'testToken',
                causeString: 'Triggered by github webhook on commit $commit to $ref by $committer',
                printContributedVariables: true,
                printPostContent: true,
                silentResponse: true
        )
    }
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([
                $class: 'GitSCM',
                branches: [[name: '*/master']],
                extensions: [],
             ])
            }
        }
        stage('Build') {
            steps {
                sh '''
                    set +x
                    ./jenkins/scripts/build.sh
                '''
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('GenImage') {
          steps {
            sh '''
             set +x
             ./jenkins/scripts/gen-image.sh
             '''
          }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}