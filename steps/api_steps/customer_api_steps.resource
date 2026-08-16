*** Settings ***
Resource    ../../resources/api_clients/CustomerClient.resource
Library     ../../resources/utilities/DataTransformer.py
Library     Collections

*** Variables ***
${API_RESPONSE}    ${EMPTY}

*** Keywords ***
a bulk payload is transmitted containing complete enterprise data
    [Arguments]    ${payload}
    ${response}=    Execute Large Data Submission POST    ${payload}
    Set Suite Variable    ${API_RESPONSE}    ${response}

the data repository verifies structural integrity of the complex data
    Should Be Equal As Integers    ${API_RESPONSE.status_code}    200
    ${response_json}=    Set Variable    ${API_RESPONSE.json()}

    Should Be Equal As Strings     ${response_json['json']['metadata']['environment']}    Staging
    Should Be Equal As Integers    ${response_json['json']['departments'][0]['headcount']}    142

    ${tags}=    Safely Get Nested Value    ${response_json}    json.tags    ${EMPTY}
    List Should Contain Value    ${tags}    performance-tested