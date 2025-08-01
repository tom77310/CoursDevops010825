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
    }
}
