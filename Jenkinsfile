pipeline{
    agent any
    stages{
        stage("Destroy Containers"){
            steps {
                sh " docker-compose down"
            }
            
        }
        // stage("Start DB"){
        //     steps {
        //     sh "docker-compose run db"
        //     sh "docker exec -it braincarve_db"}
        // }
        stage("build"){
            steps {
            sh "docker-compose up --build -d"
            }
        }
    }
}