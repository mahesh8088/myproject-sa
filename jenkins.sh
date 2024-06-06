pipeline {
    agent any
    stages{
        stage('build project'){
            steps{
                git url:'https://github.com/mahesh8088/project-sa/' , branch: "master"
                sh 'mvn clean package'
              
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t mahesh8088/staragileprojectfinance:v1 .'
                    sh 'docker images'
                }
            }
        }
         
        
     stage('Deploy') {
            steps {
                sh 'sudo docker run -itd --name My-first-containe21211 -p 8083:8081 mahesh8088/staragileprojectfinance:v1'
                  
                }
            }
        
    }
}
