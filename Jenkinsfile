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
withDockerRegistry(credentialsId: '05bf862a-02f3-45ed-b162-111eb8087b2d', url: 'https://index.docker.io/v1/') {
sh 'docker push grandhustla/homework11-project:1.0.0'
}
}
}

stage ('Run docker on new VM') {
steps {
sh 'ssh root@158.160.61.70'
withDockerRegistry(credentialsId: '05bf862a-02f3-45ed-b162-111eb8087b2d', url: 'https://index.docker.io/v1/') {
sh 'docker pull grandhustla/homework11-project:1.0.0'
}
sh 'docker run -d -p 8888:8080 grandhustla/homework11-project'
}
}
}
}
}
}
}
}