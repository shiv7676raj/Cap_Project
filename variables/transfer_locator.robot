*** Variables ***
${transfer_funds}        xpath=//a[text()='Transfer Funds']
${transfer_amount}    xpath=//input[@id='amount']
${transfer_from}     xpath=//select[@id='fromAccountId']
${transfer_to}       xpath=//select[@id='toAccountId']
${submit_btn}      xpath=//input[@value='Transfer']

${result}      xpath=//*[@id='showResult']//h1
${transfer_full_details}    xpath=//div[@id='showResult']
${funds_message}         xpath=//div[@id='showResult']/p[1]