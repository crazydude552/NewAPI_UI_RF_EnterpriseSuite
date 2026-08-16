*** Settings ***
Library    RequestsLibrary
Library    Collections
Variables  ../../config/env_staging.py

*** Keywords ***
Initialize API Session
    [Arguments]    ${alias}=api_session
    Create Session    alias=${alias}    url=${BASE_URL_API}    headers=${DEFAULT_HEADERS}    verify=True

Execute POST Request
    [Arguments]    ${endpoint}    ${payload}    ${alias}=api_session
    ${response}=    POST On Session    alias=${alias}    url=${endpoint}    json=${payload}    expected_status=any
    RETURN    ${response}

Execute GET Request
    [Arguments]    ${endpoint}    ${params}=${NONE}    ${alias}=api_session
    ${response}=    GET On Session    alias=${alias}    url=${endpoint}    params=${params}    expected_status=any
    RETURN    ${response}