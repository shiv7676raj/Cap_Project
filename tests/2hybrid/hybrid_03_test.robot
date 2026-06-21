*** Settings ***
Resource    ../../resources/pages/register_page.robot
Resource    ../../resources/pages/account_page.robot
Resource    ../../resources/pages/hybrid_03_page.robot
Resource    ../../resources/keywords/common_resources.robot

Suite Setup       Launch Application
Suite Teardown    Close Application

*** Test Cases ***
TC-E2E-03 Register User, Create Account via UI, Verify Account In API
    Register New User
    ...    first=Tom        last=Smith
    ...    street=New Street    city=New York
    ...    state=USA       zip=745833
    ...    phone=7356823671  ssn=434253221
    ...    username=tom@456
    ...    password=2343
    Create a Savings Account
    Capture Screenshot
    Log To Console    ACCOUNT_ID=${SAVINGS_ACCOUNT_ID}
    Verify Registered User Account Exists In API
