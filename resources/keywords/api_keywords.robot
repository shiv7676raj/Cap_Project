*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Resource   ../../variables/api_variables.robot

*** Keywords ***
Initialize API Suite
    ${headers}=    Create Dictionary    Accept=application/json
    Create Session
    ...    parabank
    ...    https://parabank.parasoft.com/parabank/services/bank
    ...    headers=${headers}
    ...    verify=${False}

Get Customer Accounts
    [Arguments]    ${customer_id}
    ${response}=    GET On Session
    ...    parabank
    ...    /customers/${customer_id}/accounts
    Log To Console    STATUS=${response.status_code}
    Log To Console    BODY=${response.text}
    RETURN    ${response}

Get Account Details
    [Arguments]    ${account_id}
    ${response}=    GET On Session
    ...    parabank
    ...    /accounts/${account_id}
    ...    expected_status=any
    Log To Console    STATUS=${response.status_code}
    Log To Console    BODY=${response.text}
    RETURN    ${response}

Get Account Balance
    [Arguments]    ${account_id}
    ${response}=    Get Account Details    ${account_id}
    ${account}=    Evaluate    $response.json()
    ${balance}=    Get From Dictionary  ${account}  balance
    RETURN    ${balance}

Get Account By Id
    [Arguments]    ${customer_id}    ${account_id}
    ${response}=    Get Customer Accounts    ${customer_id}
    ${accounts}=    Evaluate    $response.json()
    FOR    ${account}    IN    @{accounts}
        IF    ${account["id"]} == ${account_id}
            RETURN    ${account}
        END
    END
    Log To Console    ${accounts}
    Fail    Account ${account_id} not found

Get Invalid Customer Accounts
    [Arguments]    ${customer_id}
    ${response}=    GET On Session
    ...    parabank
    ...    /customers/${customer_id}/accounts
    ...    expected_status=any
    RETURN    ${response}