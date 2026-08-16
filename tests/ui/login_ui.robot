*** Settings ***
Documentation    UI Test Suite for Customer Portal Authentication
Resource         ../../steps/ui_steps/login_ui_steps.resource
Variables        ../../TestData/staging.yml
Library          Browser

Suite Setup      New Browser    browser=chromium    headless=True
Suite Teardown   Close Browser

*** Test Cases ***
Scenario: Successful Platform Authentication Via UI
    [Documentation]    Validates UI user login against staging environment.
    [Tags]             UI    Smoke
    Given the user navigates to the portal login page
    When authenticates using enterprise credentials    ${auth_credentials}
    Then the system grants access to the active dashboard