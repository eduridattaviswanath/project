node {
    stage('SCM checkout'){
        git 'https://github.com/eduridattaviswanath/project.git'
    }
    stage('Mvn package'){
        def mvnHome = tool name: 'maven-3', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
    }
    stage('build Docker image'){
        sh 'docker build -t dattaviswanath/javacalcpipeline1 .'
    }
    stage('Push docker image'){
        withCredentials([string(credentialsId: 'dockerpassword', variable: 'dockerhubpassword')]) {
    sh "docker login -u dattaviswanath -p ${dockerhubpassword}"
    }
    sh 'docker push dattaviswanath/javacalcpipeline1'

    }
      stage('deploy'){
        withCredentials([string(credentialsId: 'dockerpassword', variable: 'dockerhubpassword')]) {
    sh "docker login -u dattaviswanath -p ${dockerhubpassword}"
    }
    sh 'docker container run -dt --name javacalculator -p 8080:8080 dattaviswanath/javacalcpipeline1'
          

    }
    
       
    
   



}
