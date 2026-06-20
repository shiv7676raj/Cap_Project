*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../variables/api_variables.robot
Resource    ../../resources/pages/transfer_page.robot
Resource    ../../resources/pages/hybrid_02_page.robot
Resource    ../../resources/keywords/common_resources.robot

Suite Setup    Launch Application
Suite Teardown    Close Application

*** Variables ***
${account_id}             13344

*** Test Cases ***
TC-API-01 Account Type Field Matches UI Selection
    ${account}=    Get Account By Id
    ...    ${customer_id}
    ...    ${account_id}
    Log To Console    Account Type = ${account}[type]
    Should Not Be Empty    ${account}[type]
    Should Match Regexp
    ...    ${account}[type]
    ...    SAVINGS|CHECKING

TC-API-02 New Account Has Non-Negative Opening Balance
    [Documentation]    Verify newly created account has a valid non-negative opening balance
    ${account}=    Get Account By Id
    ...    ${customer_id}
    ...    ${account_id}
    ${balance}=    Get From Dictionary    ${account}    balance
    Log To Console    Account Balance = ${balance}
    Should Be True    ${balance} >= 0

TC-API-03 Source Account Balance Decreases By Transfer Amount

    Perform Transfer For API Validation

    Sleep    3s

    ${src_balance_after}=    Get Account Balance
    ...    ${SRC_ACCOUNT}

    ${expected}=    Evaluate
    ...    float(${SRC_BALANCE_BEFORE}) - float(${TRANSFER_AMT})

    Log To Console
    ...    Before=${SRC_BALANCE_BEFORE}

    Log To Console
    ...    After=${src_balance_after}

    Should Be Equal As Numbers
    ...    ${src_balance_after}
    ...    ${expected}

TC-API-04 Destination Account Balance Increases By Transfer Amount
    Click Element    ${LOGOUT}
    Perform Transfer For API Validation

    Sleep    3s

    ${dest_balance_after}=    Get Account Balance
    ...    ${DEST_ACCOUNT}

    ${expected}=    Evaluate
    ...    float(${DEST_BALANCE_BEFORE}) + float(${TRANSFER_AMT})

    Log To Console
    ...    Before=${DEST_BALANCE_BEFORE}

    Log To Console
    ...    After=${dest_balance_after}

    Should Be Equal As Numbers
    ...    ${dest_balance_after}
    ...    ${expected}

TC-API-05 GET Accounts Wrong Customer ID Returns Error
    [Documentation]    Verify API returns error for invalid customer ID
    ${response}=    Get Invalid Customer Accounts
    ...    999999999
    Log To Console    Status Code = ${response.status_code}
    Should Be True
    ...    ${response.status_code} == 400 or ${response.status_code} == 404
    Log To Console    ${response.text}