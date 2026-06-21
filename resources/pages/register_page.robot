*** Settings ***
Library    SeleniumLibrary
Resource   ../../variables/register_locator.robot

*** Keywords ***
Register New User
    [Documentation]    Opens the register page of the application
    [Arguments]    ${first}    ${last}    ${street}    ${city}    ${state}    ${zip}    ${phone}    ${ssn}    ${username}    ${password}
    Click Element    ${register}
    Input Text    ${first_name}   ${first}
    Input Text    ${last_name}   ${last}
    Input Text    ${address_street}   ${street}
    Input Text    ${address_city}   ${city}
    Input Text    ${address_state}   ${state}
    Input Text    ${address_zip}   ${zip}
    Input Text    ${phone_no}   ${phone}
    Input Text    ${ss_no}   ${ssn}
    Input Text    ${reg_username}   ${username}
    Input Text    ${reg_password}   ${password}
    Input Text    ${confirm_password}   ${password}
    Click Element    ${submit_btn}
    Page Should Contain    Your account was created successfully.