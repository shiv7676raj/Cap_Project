*** Settings ***
Library    SeleniumLibrary
Library    DataDriver   file=${EXECDIR}/Users_Details.csv   dialect=excel

Test Setup      Open Register Page
Test Teardown       Close Browser
Test Template       Register Users

*** Variables ***
${baseurl}    https://parabank.parasoft.com/parabank/index.htm
${first_name}  xpath=//input[@id="customer.firstName"]
${last_name}  xpath=//input[@id="customer.lastName"]
${address_street}  xpath=//input[@id="customer.address.street"]
${address_city}  xpath=//input[@id="customer.address.city"]
${address_state}  xpath=//input[@id="customer.address.state"]
${address_zip}  xpath=//input[@id="customer.address.zipCode"]
${phone_no}  xpath=//input[@id="customer.phoneNumber"]
${ss_no}  xpath=//input[@id="customer.ssn"]
${reg_username}  xpath=//input[@id="customer.username"]
${reg_password}  xpath=//input[@id="customer.password"]
${confirm_password}  xpath=//input[@id="repeatedPassword"]
${submit_btn}  xpath=//input[@value="Register"]

*** Test Cases ***
Register User Test

*** Keywords ***
Open Register Page
    Open Browser    ${baseurl}    chrome
    Maximize Browser Window
    Sleep    2s
    Wait Until Element Is Visible    xpath=//a[text()="Register"]  timeout=10s
    Click Element    xpath=//a[text()="Register"]
    
Register Users
    [Arguments]    ${first}    ${last}    ${street}    ${city}    ${state}    ${zip}    ${phone}    ${ssn}    ${username}    ${password}    ${confirm}
    Input Text    ${first_name}   ${first}
    Input Text    ${last_name}  ${last}
    Input Text    ${address_street}  ${street}
    Input Text    ${address_city}  ${city}
    Input Text    ${address_state}  ${state}
    Input Text    ${address_zip}  ${zip}
    Input Text    ${phone_no}  ${phone}
    Input Text    ${ss_no}  ${ssn}
    Input Text    ${reg_username}  ${username}
    Input Text    ${reg_password}  ${password}
    Input Text    ${confirm_password}  ${confirm}
    Click Element  ${submit_btn}






