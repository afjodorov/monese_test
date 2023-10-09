*** Settings ***
Library    AppiumLibrary
Library    RequestsLibrary
Resource    conf_variables.robot

*** Keywords ***
Open chrome browser
    Open Application    ${REMOTE_URL}    platformName=Android    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME_LCL}    automationName=${AUTOMATION_NAME}    browserName=Chrome    autoAcceptAlerts=true

Click element with timeout
    [Arguments]    ${element}
    ${timeout}  Set Variable    10
    Wait Until Page Contains Element    ${element}    ${timeout}
    Wait Until Element Is Visible    ${element}    ${timeout}
    Click Element    ${element}

GET to gorest
    [Arguments]    ${end_point}    ${token}    ${user_id}    
    ${url}    Set variable       ${BASE_URL}${API_VERSION}${end_point}/${user_id}?access-token=${token}
    ${GET_resp}    GET    ${url}  

    Return From Keyword    ${GET_resp}

POST to gorest
    [Arguments]    ${end_point}    ${token}    ${body}    
    ${url}    Set variable       ${BASE_URL}${API_VERSION}${end_point}?access-token=${token}
    ${POST_resp}    POST    ${url}     data=${body}
    Status Should Be    201    ${POST_resp}    

    Return From Keyword    ${POST_resp}

PUT change user status
    [Arguments]    ${token}    ${user_id}    ${status}
    ${body}    Create Dictionary      status=${status}

    ${url}    Set Variable    ${BASE_URL}${API_VERSION}/users/${user_id}?access-token=${token}
    ${PUT_resp}    PUT    ${url}    data=${body}
    
Delete user from gorest
    [Arguments]    ${user_id}    ${token}
    ${url}    Set variable      ${BASE_URL}${API_VERSION}/users/${user_id}?access-token=${token}
    DELETE   ${url}
