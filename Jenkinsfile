pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    apt-get update && apt-get install -y python3-pip python3-venv nodejs npm || true
                    python3 -m pip install --upgrade pip --break-system-packages
                    pip install -r requirements.txt --break-system-packages
                    rfbrowser init
                '''
            }
        }

        stage('Run Test Suite') {
            steps {
                sh 'robot --variablefile config/env_staging.py -d results tests/'
            }
        }
    }

    post {
        always {
            robot outputPath: 'results',
                  outputFileName: 'output.xml',
                  reportFileName: 'report.html',
                  logFileName: 'log.html',
                  passThreshold: 100.0,
                  unstableThreshold: 80.0

            archiveArtifacts artifacts: 'results/*.html', allowEmptyArchive: true
        }
    }
}