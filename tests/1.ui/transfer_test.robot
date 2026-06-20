*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/login_page.robot
Resource    ../../variables/login_details.robot
Resource    ../../resources/pages/transfer_page.robot

Suite Setup    Launch Application
Suite Teardown   Close Application

*** Test Cases ***

TC-TF-UI-01
    Login To Application    ${NEW_USERNAME}    ${NEW_PASSWORD}
    Transfer Funds
    ...    100
    ...    0
    ...    1


TC-TF-UI-02
    Click Element    ${LOGOUT}
    Login To Application    ${NEW_USERNAME}    ${NEW_PASSWORD}
    Transfer Funds
    ...    50
    ...    0
    ...    1
    Verify Transfer Details Displayed