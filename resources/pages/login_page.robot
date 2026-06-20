*** Settings ***
Library    SeleniumLibrary
Resource   ../../variables/login_locator.robot
Resource   ../../variables/login_details.robot

*** Keywords ***
Login To Application
    [Documentation]    Opens the login page of the application and logs in with provided credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${login_username}   ${username}
    Input Text    ${login_password}   ${password}
    Click Element    ${login_btn}
    Page Should Contain    Welcome
