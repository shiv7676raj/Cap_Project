*** Settings ***
Library     SeleniumLibrary
Resource    ../../variables/transfer_locator.robot
Resource    ../../resources/keywords/api_keywords.robot

*** Keywords ***
Transfer Funds
    [Documentation]    Transfer funds between two accounts
    [Arguments]    ${amount}    ${from_index}    ${to_index}
    Wait Until Element Is Visible    ${transfer_funds}    10s
    Click Element    ${transfer_funds}
    Wait Until Element Is Visible    ${transfer_amount}     10s
    Wait Until Element Is Visible       xpath=//select[@id='fromAccountId']/option      10s
    Wait Until Element Is Visible       xpath=//select[@id='toAccountId']/option    10s
    Select From List By Index    ${transfer_from}    ${from_index}
    ${from_account_id}=    Get Selected List Value    ${transfer_from}
    Select From List By Index    ${transfer_to}    ${to_index}
    ${to_account_id}=    Get Selected List Value    ${transfer_to}
    Set Suite Variable    ${SRC_ACCOUNT}       ${from_account_id}
    Set Suite Variable    ${DEST_ACCOUNT}  ${to_account_id}
    Set Suite Variable    ${TRANSFER_AMT}      ${amount}

    ${src_balance_before}=    Get Account Balance       ${from_account_id}
    Set Suite Variable      ${SRC_BALANCE_BEFORE}       ${src_balance_before}
    ${dest_balance_before}=    Get Account Balance      ${to_account_id}
    Set Suite Variable      ${DEST_BALANCE_BEFORE}      ${dest_balance_before}

    Input Text    ${transfer_amount}    ${amount}
    Click Element    ${submit_btn}
    Wait Until Element Is Visible    ${result}    10s
    Element Text Should Be      ${result}       Transfer Complete!
    Page Should Contain    ${amount}

    Log To Console    SRC_ACCOUNT=${SRC_ACCOUNT}
    Log To Console    DEST_ACCOUNT=${DEST_ACCOUNT}
    Log To Console    SRC_BALANCE_BEFORE=${SRC_BALANCE_BEFORE}
    Log To Console    DEST_BALANCE_BEFORE=${DEST_BALANCE_BEFORE}

Verify Transfer Details Displayed
    [Documentation]    Verify transfer details are displayed after successful transfer
    Element Should Be Visible    ${result}
    Element Should Be Visible    ${transfer_full_details}
    Element Should Be Visible    ${funds_message}
    Log To Console    Funds transferred successfully!