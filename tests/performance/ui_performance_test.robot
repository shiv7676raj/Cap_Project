*** Settings ***
Resource    ../../resources/keywords/common_resources.robot

Suite Setup       Open Application
Suite Teardown    Close Application

*** Test Cases ***
Capture UI Page Load Time
    ${load_time}=    Execute Javascript
    ...    return (window.performance.timing.loadEventEnd - window.performance.timing.navigationStart)/1000;
    Log To Console    UI Load Time = ${load_time} seconds
    Should Be True    ${load_time} > 0