pipeline {
    agent {
        docker {
            image 'node_ts_cypress'
        }
    }

    environment {
        dockerhub_credential_id = 'credential_dockerhub_didierdefrance69'
        docker_registry = 'https://registry.hub.docker.com'
        docker_image_name = 'didierdefrance69/simple-js-project:1'
    }

    stages {
        stage('Cloner depuis GitHub') {
            steps {
                git url: 'https://github.com/tom77310/CoursDevops010825', branch: 'main'
            }
        }

        stage('Installation des dépendances') {
            steps {
                echo 'npm install'
                sh 'npm install'
            }
        }

        stage('Lancer les tests') {
            steps {
                echo 'Exécution de npm test'
                sh 'npm test'
            }
        }

        stage('Build de l\'image Docker') {
            steps {
                script {
                    echo "docker_image_name = ${docker_image_name}"
                    dockerImage = docker.build(docker_image_name)
                }
            }
        }

        stage('Push de l\'image Docker') {
            steps {
                script {
                    echo "docker_registry = ${docker_registry}"
                    echo "dockerhub_credential_id = ${dockerhub_credential_id}"
                    docker.withRegistry(docker_registry, dockerhub_credential_id) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
