*** Settings ***
Library    SeleniumLibrary
Library    ../../config/env_loader.py
Resource   ../../resources/keywords/api_keywords.robot

*** Variables ***
${BASE_URL}    https://parabank.parasoft.com/parabank/index.htm
${BROWSER}     chrome

*** Keywords ***
Open Application
    [Documentation]    Opens the application
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
Launch Application
    Open Application
    Initialize API Suite
Capture Screenshot
    [Documentation]    Captures screenshots for debugging
    Capture Page Screenshot     screenshots/${TEST NAME}.png
Close Application
    Close All Browsers