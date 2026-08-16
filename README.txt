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