*** Settings ***
Resource    ../keywords/api_keywords.robot
Resource    ../../resources/pages/account_page.robot

*** Keywords ***
Verify Registered User Account Exists In API
    Sleep    5s
    ${response}=    Get Account Details
    ...    ${SAVINGS_ACCOUNT_ID}

    Log To Console    STATUS=${response.status_code}
    Log To Console    BODY=${response.text}

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    200