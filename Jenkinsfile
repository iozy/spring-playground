pipeline {
    agent {
        kubernetes {
            yamlFile 'pod.yaml'
            workspaceVolume hostPathWorkspaceVolume('/workspace')
            defaultContainer 'builder'
        }
    }
    
    environment {
        GRADLE_USER_HOME = "/home/jenkins/agent"
    }

    stages {
        stage('Build') {
            steps {
                sh './gradlew assemble'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Docker') {
            steps {
                sh './gradlew docker dockerPush'
            }
        }
    }
}
