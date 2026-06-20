*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../variables/api_variables.robot

Suite Setup    Initialize API Suite

*** Test Cases ***
API Response Under 2 Seconds
    ${start}=    Evaluate    __import__('time').time()
    ${response}=    Get Customer Accounts
    ...    ${customer_id}
    ${end}=    Evaluate    __import__('time').time()
    ${time_taken}=    Evaluate
    ...    round(${end}-${start},3)

    Log To Console    Response Time = ${time_taken} sec
    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    200
    Should Be True
    ...    ${time_taken} < 2

Repeated GET Accounts 20 Times
    FOR    ${i}    IN RANGE    20
        ${response}=    Get Customer Accounts
        ...    ${customer_id}
        Should Be Equal As Integers
        ...    ${response.status_code}
        ...    200
    END

Basic Throughput Validation
    ${start}=    Evaluate    __import__('time').time()
    FOR    ${i}    IN RANGE    10
        Get Customer Accounts
        ...    ${customer_id}
    END
    ${end}=    Evaluate    __import__('time').time()
    ${total}=    Evaluate
    ...    round(${end}-${start},3)
    Log To Console    Total Time = ${total} sec