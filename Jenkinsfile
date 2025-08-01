pipeline {
    //agent any
    //agent { label 'node' }
    //agent { label '! without-node' }
    agent {
        docker {
		 image 'node_ts_cypress' 
		}
     }
     environment{
	    //NB: credential_dockerhub_didierdefrance69 is ID of credential
		//prepared in "Admin Jenkins / Credentials / system /global"
		dockerhub_credential_id='credential_dockerhub_didierdefrance69'
		
		//dockerRegistry is dockerhub
		docker_registry= 'https://registry.hub.docker.com'
		
		docker_image_name='didierdefrance69/vanilla_cypress_frontend:1'
	}
    stages {
	stage('from_git') {
            steps {
                  git url : 'https://github.com/tom77310/CoursDevops010825' , branch : 'main'
            }
        }
        stage('npm_install') {
            steps {
				echo 'npm install'
				sh 'npm install'
            }
        }
	stage('tests') {
            steps {
				echo 'run ic script of package.json (start-server-and-test(http-server,3000,cypress))'
				sh 'npm run ic'
            }
        }
	stage('build_docker_image') {
			steps {
            //sh 'docker build -t didierdefrance69/vanilla_cypress_frontend:1 .'
            //with Pipeline docker plugin:
			script{
				    echo "docker_image_name=" + docker_image_name
				    dockerImage = docker.build(docker_image_name)
				  }
			   }
        }
	stage('push_docker_image') {
            steps {
			  script{
					echo "docker_registry=" + docker_registry
					echo "dockerhub_credential_id=" +dockerhub_credential_id
					docker.withRegistry( docker_registry, dockerhub_credential_id ) { 
					     dockerImage.push() 
						 }
					  }
				  }
		}
    }
}
