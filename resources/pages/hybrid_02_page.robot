*** Settings ***
Resource    ../keywords/api_keywords.robot
Resource    ../../variables/login_details.robot
Resource    ../../resources/pages/login_page.robot
Resource    ../../resources/pages/transfer_page.robot

*** Keywords ***
Perform Transfer For API Validation
    Login To Application    ${NEW_USERNAME}     ${NEW_PASSWORD}
    Transfer Funds
    ...    100
    ...    0
    ...    1

Verify Transfer Debit Equals Credit
    Sleep    5s
    ${src_after}=    Get Account Balance    ${SRC_ACCOUNT}
    ${dest_after}=    Get Account Balance   ${DEST_ACCOUNT}
    ${src_diff}=    Evaluate    round(float(${SRC_BALANCE_BEFORE}) - float(${src_after}), 2)
    ${dest_diff}=    Evaluate   round(float(${dest_after}) - float(${DEST_BALANCE_BEFORE}), 2)
    Log To Console      Source Before = ${SRC_BALANCE_BEFORE}
    Log To Console      Source After = ${src_after}
    Log To Console      Destination Before = ${DEST_BALANCE_BEFORE}
    Log To Console      Destination After = ${dest_after}
    Log To Console      Source Difference = ${src_diff}
    Log To Console      Destination Difference = ${dest_diff}
    Should Be Equal As Numbers      ${src_diff}     ${dest_diff}
    Should Be Equal As Numbers      ${src_diff}     ${TRANSFER_AMT}