pipeline {
    agent {
        docker {
            image 'node_ts_cypress'
        }
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
                    def dockerImage = docker.build(docker_image_name) // ✅ déclaration avec 'def'
                }
            }
        }
    }
}
