def app
def fortifyCredentialsId = "fortifyCredentialsId"
pipeline{

        agent{
            label 'master'
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
                bat "mvn clean package -DskipTests"

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

  docker.withRegistry('https://hellodevuscacr.azurecr.io', 'hellodevuscacr') {
      app.push("${env.BUILD_NUMBER}")
      app.push("latest")

      }
     	}
    }

}
}
}
