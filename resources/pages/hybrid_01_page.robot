*** Settings ***
Resource    ../keywords/api_keywords.robot
Resource    ../../resources/pages/account_page.robot

*** Keywords ***
Verify Created Savings Account In API
    Sleep    5s
    ${response}=    Get Account Details     ${SAVINGS_ACCOUNT_ID}
    ${account}=    Evaluate     $response.json()
    Log To Console    ${account}
    Should Be Equal     ${account}[type]    SAVINGS