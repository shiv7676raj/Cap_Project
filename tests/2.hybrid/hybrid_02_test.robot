*** Settings ***
Resource    ../../resources/pages/hybrid_02_page.robot
#Resource    ../../resources/keywords/api_keywords.robot
#Resource    ../../tests/api/api_test_cases.robot
Resource    ../../resources/keywords/common_resources.robot

Suite Setup       Launch Application
Suite Teardown    Close Application

*** Test Cases ***
TC-E2E-02 Transfer Debit Equals Credit - No Money Lost
    Perform Transfer For API Validation
    Verify Transfer Debit Equals Credit
