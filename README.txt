RobotFramework_Enterprise_Suite/
│
├── config/
│   ├── env_dev.py                  # Dev environment configuration
│   └── env_staging.py              # Staging environment configuration
│
├── TestData/
│   ├── dev.yml                     # Environment-specific test data (Dev)
│   └── staging.yml                 # Environment-specific test data (Staging)
│
├── resources/
│   ├── api_clients/
│   │   ├── BaseClient.resource     # Generic HTTP request wrappers & token management
│   │   └── CustomerClient.resource # Customer-specific API endpoints
│   │
│   ├── page_objects/
│   │   ├── BasePage.resource       # Generic UI keywords (clicks, inputs, waits)
│   │   └── LoginPage.resource      # Login page locators & actions
│   │
│   └── utilities/
│       ├── DataTransformer.py      # Custom Python methods for serialization & JSON manipulation
│       └── EnvLoader.py            # Dynamic environment & YAML loader
│
├── steps/
│   ├── api_steps/
│   │   └── customer_api_steps.resource  # Business-level steps for API tests
│   └── ui_steps/
│       └── login_ui_steps.resource      # Business-level steps for UI tests
│
├── tests/
│   ├── api/
│   │   ├── customer_api.robot       # API test scenarios
│   │   └── data_driven_payloads.robot
│   └── ui/
│       └── login_ui.robot          # UI test scenarios
│
├── results/                        # Standard Robot execution output directory
│   ├── output.xml
│   ├── log.html
│   └── report.html
│
└── requirements.txt                # Project dependencies


Run in Local PIPELINE
Step 1: Launch Jenkins Locally via Docker
Run this command in your PowerShell/Terminal to spin up a local Jenkins instance:

PowerShell
docker run -d --name jenkins-local -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
To retrieve your initial unlock password, run:

PowerShell
docker logs jenkins-local
(Copy the long alphanumeric password printed near the bottom of the logs).

Step 2: Initial Jenkins Setup
Open http://localhost:8080 in your browser.

Paste the unlock password and click Continue.

Select Install suggested plugins.

Create your admin user credentials and finish the setup wizard.

Step 3: Install the Robot Framework Plugin
In the Jenkins dashboard, go to Manage Jenkins > Plugins > Available plugins.

Search for Robot Framework.

Select Robot Framework plugin and click Install.

Restart Jenkins when prompted (or check Restart Jenkins when installation is complete).

Step 4: Create & Run Your Pipeline Job
From the Jenkins home screen, click New Item.

Enter the item name: NewAPI_UI_RF_EnterpriseSuite.

Select Pipeline and click OK.

Scroll down to the Pipeline section at the bottom:

Definition: Select Pipeline script from SCM.

SCM: Select Git.

Repository URL: [https://github.com/crazydude552/NewAPI_UI_RF_EnterpriseSuite.git](https://github.com/crazydude552/NewAPI_UI_RF_EnterpriseSuite.git)

Branch Specifier: */main (or */master, depending on your default branch).

Script Path: Verify it says Jenkinsfile.

Click Save.

Click Build Now on the left menu.

docker stop jenkins-local
docker rm jenkins-local
docker run -d --name jenkins-local -p 8085:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -u root jenkins/jenkins:lts