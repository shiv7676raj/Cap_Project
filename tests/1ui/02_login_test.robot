*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/login_page.robot
Resource    ../../variables/login_details.robot

Suite Setup    Open Application
Suite Teardown   Close Application

*** Test Cases ***
TC-REG-UI-02
    [Documentation]    To login with registered credentials
    Login To Application    ${NEW_USERNAME}    ${NEW_PASSWORD}