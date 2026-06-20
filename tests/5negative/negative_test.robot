*** Settings ***
Resource    ../../resources/pages/login_page.robot
Resource    ../../resources/pages/negative_page.robot
Resource    ../../variables/login_details.robot
Resource    ../../resources/keywords/common_resources.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-REG-UI-03
    [Documentation]     Registration – Required Fields Left Empty
    Registration Required Fields Empty

TC-REG-UI-04
    [Documentation]     Registration – Password and Confirm Don't Match
    Registration Password Mismatch

TC-NEG-03
    [Documentation]     Access Transfer Funds Page Without Login
    Access Transfer Funds Without Login

TC-REG-UI-05
    [Documentation]     Registration – Already Used Username is Rejected
    Registration Existing Username
    ...    ${NEW_USERNAME}

TC-NEG-04
    [Documentation]     Login with Wrong Credentials
    Login With Wrong Credentials