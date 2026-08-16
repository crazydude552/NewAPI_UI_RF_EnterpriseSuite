*** Settings ***
Resource    BaseClient.resource

*** Keywords ***
Execute Large Data Submission POST
    [Arguments]    ${payload_dict}
    ${response}=    Execute POST Request    /post    ${payload_dict}
    RETURN    ${response}

Execute Get Customer Details
    [Arguments]    ${query_params}
    ${response}=    Execute GET Request    /get    ${query_params}
    RETURN    ${response}