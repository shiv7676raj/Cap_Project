*** Settings ***
Library    SeleniumLibrary
Resource   ../../variables/account_locator.robot

*** Keywords ***
Create a Savings Account
    [Documentation]    Creates a new saving account for the logged-in user
    Click Element    ${open_account}
    Wait Until Element Is Visible    ${account_type}    10s
    Select From List By Index    ${account_type}    ${savings_type_index}
    Wait Until Element Is Visible    ${open_account_btn}    10s
    Click Element    ${open_account_btn}
    Wait Until Element Is Visible    ${result_msg}    3s
    Page Should Contain    Congratulations
    ${savings_account_id}=    Get Text    ${new_account_id}
    Log To Console    ${savings_account_id}
    Set Suite Variable    ${SAVINGS_ACCOUNT_ID}   ${savings_account_id}

Create a Checking Account
    [Documentation]    Creates a new saving account for the logged-in user
    #Wait Until Element Is Visible    ${open_account}    10s
    Click Element    ${open_account}
    Wait Until Element Is Visible    ${account_type}    10s
    Select From List By Index    ${account_type}    ${checking_type_index}
    Wait Until Element Is Visible    xpath=//select[@id='fromAccountId']/option    10s
    Select From List By Index    ${from_account}    0
    Click Element    ${open_account_btn}
    Wait Until Element Is Visible    ${result_msg}    10s
    Page Should Contain    Congratulations
    ${checking_account_id}=    Get Text    ${new_account_id}
    Log To Console    ${checking_account_id}
    Set Suite Variable      ${CHECKING_ACCOUNT_ID}    ${checking_account_id}

Accounts Overview Displays Created Accounts
    [Documentation]    to verify a created account is visible in the Accounts Overview page
    [Arguments]     ${savings_account_id}    ${checking_account_id}
    Click Element    ${accounts_overview}
    Sleep    5s
    Wait Until Element Is Visible    ${accounts_table}    10s
    ${table_text}=    Get Text    ${accounts_table}
    Should Contain    ${table_text}    ${savings_account_id}
    Should Contain    ${table_text}    ${checking_account_id}
    Log To Console    Accounts are visible!

