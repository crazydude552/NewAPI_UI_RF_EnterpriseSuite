*** Settings ***
Resource    ../../resources/page_objects/LoginPage.resource

*** Keywords ***
the user navigates to the portal login page
    Navigate To Login Page

authenticates using enterprise credentials
    [Arguments]    ${credentials}
    Fill Login Form    ${credentials['username']}    ${credentials['password']}

the system grants access to the active dashboard
    Verify Successful Dashboard Load