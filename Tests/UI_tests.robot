*** Settings ***
Library    AppiumLibrary
Resource    ../Resources/global_keywords.robot
Resource    ../Resources/locators.robot

*** Test Cases ***
Login to gorest.co.in via gmail and retrieve bearer token
    Open chrome browser

    Go To Url    ${BASE_URL}   

    Navigate to login page
    
    Login via gmail

    Retrieve bearer token

*** Keywords ***
Navigate to login page
    Accept popup if present    ${ACCEPT_CONSENT_BUTTON}
 
    Click element with timeout    ${NAV_BAR_BUTTON}

    Click element with timeout    ${NAV_BAR_LOGIN_BUTTON}

    Click element with timeout    ${GMAIL_BUTTON}
    
    Sleep    3s
    
    Click right top corner for closing ad

Login via gmail
    Wait Until Page Contains Element    ${GMAIL_EMAIL_IDENT}

    Input Text    ${GMAIL_EMAIL_FIELD}    ${GOREST_EMAIL}

    Click element with timeout    ${GMAIL_EMAIL_NEXT_BUTTON}

    Wait Until Page Contains Element    ${GMAIL_PSWD_IDENT}
 
    Input Password    ${GMAIL_PSWD_FIELD}    ${GOREST_PASS}

    Click element with timeout    ${GMAIL_PSWD_NEXT_BUTTON}

Retrieve bearer token
    Switch To Context    NATIVE_APP
    Wait Until Page Contains Element    ${ACCESS_TOKEN_VIEW}
    Wait Until Element Is Visible   ${ACCESS_TOKEN_VIEW}
    Switch To Context    CHROMIUM
    
    ${token}    Get Text    ${ACCESS_TOKEN_LABEL}

    Should Be Equal    ${token}    ${ACCESS_TOKEN_API}

Accept popup if present
    [Arguments]    ${element}
    Sleep    5s

    ${stat}    Run Keyword And Return Status    Element Should Be Visible   ${element}

    IF  "${stat}" == "True"
        Click element with timeout    ${element}
    END    

Click right top corner for closing ad
    #Awful hacks to close ad, since could not obtain locators of an ad in iframe :*(
    Click Element At Coordinates    1000    300
    
    Sleep    3s
    
    Click Element At Coordinates    500    500
    

    



