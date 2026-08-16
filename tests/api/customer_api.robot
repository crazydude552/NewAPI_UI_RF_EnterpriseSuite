*** Settings ***
Documentation    API Test Suite for Customer Endpoints
Resource         ../../steps/api_steps/customer_api_steps.resource
Variables        ../../TestData/staging.yml

Suite Setup      Initialize API Session

*** Test Cases ***
Scenario: Ingest Heavy Structural Record Sets Via Bulk POST
    [Documentation]    Validates JSON serialization and nested assertions on bulk POST.
    [Tags]             API    Regression    Bulk
    Given a bulk payload is transmitted containing complete enterprise data    ${large_payload}
    Then the data repository verifies structural integrity of the complex data