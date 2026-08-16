*** Settings ***
Library      Browser
Variables    ../../config/env_staging.py

*** Variables ***
${USERNAME_INPUT}    css=#user-name
${PASSWORD_INPUT}    css=#password
${LOGIN_BUTTON}      css=#login-button
${DASHBOARD_HEADER}  css=.app_logo

*** Keywords ***
Navigate To Login Page
    New Page    ${BASE_URL_UI}

Fill Login Form
    [Arguments]    ${username}    ${password}
    Fill Text    ${USERNAME_INPUT}    ${username}
    Fill Text    ${PASSWORD_INPUT}    ${password}
    Click        ${LOGIN_BUTTON}

Verify Successful Dashboard Load
    Get Text    ${DASHBOARD_HEADER}    contains    Swag Labs