def app
def fortifyCredentialsId = "fortifyCredentialsId"
pipeline{

        agent{
            label 'docker-azcli-kubectl-slave'
        }

        tools{
            maven 'Maven'
            jdk 'Java 1.8'
        }
          stages{
            /*stage('env configure') {
                steps{
                    sh '''
                    echo "PATH = ${PATH}"
                    echo "MAVEN_HOME = ${MAVEN_HOME}"
                    '''
                }
            }*/
            stage('checkout'){
              steps{
	      	script{
                  checkout scm


            }
	    }
          }
          stage('build'){
            steps{
	    	script{
                sh "mvn clean package -DskipTests"

            }
	    }
       }
stage('Registring image and Docker image Build'){
    steps{
     	script{
app = docker.build("demoapp")
}
}
}

stage('Push image to ACR with buildno tag'){
    steps{
     	script{
//You would need to first register with ACR before you can push images to your account

  docker.withRegistry('https://portaltstuscacr.azurecr.io', 'portaltstuscacr') {
      app.push("${env.BUILD_NUMBER}")
      app.push("latest")

      }
     	}
    }

}
}
}
