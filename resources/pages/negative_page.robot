*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/login_locator.robot
Resource    ../../variables/register_locator.robot

*** Keywords ***
Registration Required Fields Empty
    Click Element    ${register}
    Click Element    ${submit_btn}
    Wait Until Page Contains    First name is required.    10s
    Page Should Contain    Last name is required.
    Page Should Contain    Address is required.
    Page Should Contain    City is required.
    Page Should Contain    State is required.
    Page Should Contain    Zip Code is required.
    Page Should Contain    Social Security Number is required.
    Page Should Contain    Username is required.
    Page Should Contain    Password is required.
    Page Should Contain    Password confirmation is required.

Registration Password Mismatch
    Click Element    ${register}
    Input Text    ${first_name}          Aditi
    Input Text    ${last_name}           Kaur
    Input Text    ${address_street}      Church Street
    Input Text    ${address_city}        Bangalore
    Input Text    ${address_state}       Karnataka
    Input Text    ${address_zip}         560001
    Input Text    ${phone_no}            9876543210
    Input Text    ${ss_no}               123456789
    Input Text    ${reg_username}        aditi123
    Input Text    ${reg_password}        kaur@123
    Input Text    ${confirm_password}    kaur@999
    Click Element    ${submit_btn}
    Wait Until Page Contains    Passwords did not match.    10s

Registration Existing Username
    [Arguments]    ${username}
    Click Element    ${register}
    Input Text    ${first_name}          Ayush
    Input Text    ${last_name}           Singh
    Input Text    ${address_street}      Church Street
    Input Text    ${address_city}        Bangalore
    Input Text    ${address_state}       Karnataka
    Input Text    ${address_zip}         560001
    Input Text    ${phone_no}            9365273672
    Input Text    ${ss_no}               123456789
    Input Text    ${reg_username}        ${username}
    Input Text    ${reg_password}        ayu@123
    Input Text    ${confirm_password}    ayu@123
    Click Element    ${submit_btn}
    Wait Until Page Contains    This username already exists.   10s

Login With Wrong Credentials
    Input Text    ${login_username}    123sam
    Input Text    ${login_password}    pa688$
    Click Element    ${login_btn}
    Wait Until Page Contains    The username and password could not be verified.    10s

Access Transfer Funds Without Login
    Go To       https://parabank.parasoft.com/parabank/transfer.htm
    Wait Until Page Contains    Customer Login      10s