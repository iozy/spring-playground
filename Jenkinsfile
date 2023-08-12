pipeline {
    agent kubernetes {
        yamlFile pod.yaml
        workspaceVolume hostPathWorkspaceVolume('/workspace')
        defaultContainer 'builder'
    }

    triggers {
        pollSCM '* * * * *'
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
    }
}
