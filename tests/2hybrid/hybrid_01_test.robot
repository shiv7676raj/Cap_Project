*** Settings ***
Resource    ../../resources/pages/account_page.robot
Resource    ../../resources/pages/hybrid_01_page.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../variables/login_details.robot
Resource    ../../resources/pages/login_page.robot
Resource    ../../resources/keywords/common_resources.robot

Suite Setup       Launch Application
Suite Teardown    Close Application

*** Test Cases ***
TC-E2E-01 Create Account via UI and Verify it Exists in API
    Login To Application    ${NEW_USERNAME}     ${NEW_PASSWORD}
    Log To Console    CUSTOMER_ID=${customer_id}
    Create a Savings Account
    Log To Console    ACCOUNT_ID=${SAVINGS_ACCOUNT_ID}
    Verify Created Savings Account In API