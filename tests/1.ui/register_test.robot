*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/register_page.robot
Resource    ../../variables/login_details.robot

Suite Setup    Open Application
Suite Teardown   Close Application

*** Test Cases ***
TC-REG-UI-01
    [Documentation]    To register a user
    Register New User
    ...    first=Piya        last=Verma
    ...    street=Church Street    city=Washington
    ...    state=USA       zip=857453
    ...    phone=9876543210  ssn=847887643
    ...    username=${NEW_USERNAME}
    ...    password=${NEW_PASSWORD}
