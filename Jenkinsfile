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
    agent {
        docker {
            image 'maven:3.8'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                    set -x
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
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}