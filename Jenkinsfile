pipeline {
    agent any

    stages {
        stage('Cloner le dépôt') {
            steps {
                // Ce bloc est utile si Jenkins clone automatiquement, sinon on peut l'enlever
                echo 'Clonage du dépôt terminé.'
            }
        }

        stage('Installation des dépendances') {
            steps {
                sh 'npm install'
            }
        }

        stage('Lancer les tests') {
            steps {
                sh 'npm test'
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminé'
        }
        success {
            echo 'Succès des tests !'
        }
        failure {
            echo 'Échec des tests.'
        }
    }
}
