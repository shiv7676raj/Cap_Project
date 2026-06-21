*** Variables ***
${open_account}     xpath=//a[text()='Open New Account']
${account_type}     xpath=//select[@id='type']
${from_account}     xpath=//select[@id='fromAccountId']
${open_account_btn}     xpath=//input[@type='button']
${result_msg}     xpath=//div[@id='openAccountResult']//p
${new_account_id}   xpath=//a[@id='newAccountId']
${savings_type_index}         1
${checking_type_index}        0
${accounts_overview}      xpath=//a[text()='Accounts Overview']
${accounts_table}       xpath=//table[@id='accountTable']

