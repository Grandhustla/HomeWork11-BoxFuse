pipeline {
  agent {
    docker {
      image 'grandhustla/homework11-buildcontainer:1.0.0'
        args '--privileged -v /var/run/docker.sock:/var/run/docker.sock -v /root:/root -u root'
    }
  }

  stages {
    stage ('Clone git project boxfuse') {
      steps {
        git 'https://github.com/Grandhustla/HomeWork11-BoxFuse.git'
      }
    }

    stage ('Build Project BoxFuse') {
      steps {
        sh 'mvn package'
      }
    }

    stage ('Create docker container with a .war file BoxFuse app') {
      steps {
        sh 'docker build -t grandhustla/homework11-project:1.0.0 -f Dockerfile .'
         withDockerRegistry(credentialsId: '62d1263a-54b8-467a-8e76-002cc88115e9', url: 'https://index.docker.io/v1/') {
            sh 'docker push grandhustla/homework11-project:1.0.0'
          }
      }
    }

//     stage ('Run docker on new VM') {
//       steps {
//         sshagent(['322d5d2b-7900-4fdd-8035-0f83c6826a11']) {
//           sh 'ssh root@158.160.61.235'
//           withDockerRegistry(credentialsId: '62d1263a-54b8-467a-8e76-002cc88115e9', url: 'https://index.docker.io/v1/') {
//             sh 'docker pull grandhustla/homework11-project:1.0.0'
//           }
//           sh 'docker run -d grandhustla/homework11-project:1.0.0'
//         }
//       }
//     }
//     stage ('Connect to VM') {
//       steps {
//         sh 'ssh root@158.160.61.235'
//       }
//     }

    stage ("Pull image and run docker") {
      steps {
        sh '''ssh root@158.160.61.235 << EOF
        docker login -u *********** -p ******************** docker.io
        docker pull grandhustla/homework11-project:1.0.0
        docker run -d -p 8888:8080 grandhustla/homework11-project:1.0.0
        '''
      }
    }
  }
}