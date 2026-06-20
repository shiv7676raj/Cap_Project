*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/login_page.robot
Resource    ../../variables/login_details.robot
Resource    ../../resources/pages/account_page.robot

Suite Setup    Open Application
Suite Teardown   Close Application

*** Test Cases ***
TC-AC-UI-01&02
    Login To Application    ${NEW_USERNAME}    ${NEW_PASSWORD}
    Create a Savings Account
    Create a Checking Account
TC-AC-UI-03
    Accounts Overview Displays Created Accounts    ${SAVINGS_ACCOUNT_ID}    ${CHECKING_ACCOUNT_ID}