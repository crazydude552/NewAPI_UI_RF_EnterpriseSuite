pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    apt-get update && apt-get install -y python3-pip python3-venv nodejs npm || true

                    if [ ! -f requirements.txt ]; then
                        echo "requirements.txt not found! Creating default..."
                        echo -e "robotframework>=6.1.1\nrobotframework-requests>=0.9.5\nrobotframework-browser>=17.2.0\npyyaml>=6.0.1" > requirements.txt
                    fi

                    pip install -r requirements.txt --break-system-packages
                    rfbrowser init --with-deps
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