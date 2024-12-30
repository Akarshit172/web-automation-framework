*** Settings ***
Library    SeleniumLibrary
#Library    ../../libraries/custom_selenium_keywords.py  # Import Python custom keywords

*** Keywords ***
Perform Login Steps
    [Arguments]    ${user}
    Wait For Page To Load
    Capture Screenshot
    Click Re_Login Button
    Capture Screenshot
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Wait For Menu To Load
    Capture Screenshot

Perform Logout Steps
    Click Logout
    Capture Screenshot
    Click Logout_Pop_Up_Yes Button
    Capture Screenshot

Perform Site Visit Steps
    [Arguments]    ${user}
    Wait For Page To Load
    Capture Screenshot
    Click Re_Login Button
    Capture Screenshot
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Wait For Menu To Load
    Click Menu Button
    Capture Screenshot
    Click PRE LIQUIDATED CASES
    Capture Screenshot
    #Select Arab National Bank
    Capture Screenshot
    #Click RuleName    ${user['ruleName']}
    Sleep    4s
    Capture Screenshot
    Click On CR    ${user['CR']}
    Sleep    4s
    Capture Screenshot
    Select Dropdown Value    //select[@id="disposition"]    ${user['disposition']}
    Sleep    4s
    Select Checkbox By Label Text    ${user['Guarantee A/c No. / #CR']}
    Sleep    4s
    Capture Screenshot
    Select Dropdown Value    //select[@id="communicationMode"]    ${user['communicationMode']}
    Sleep    4s
    Capture Screenshot
    Select Dropdown Value    //select[@id="dispositionBy"]    ${user['dispositionBy']}
    Sleep    2s
    Capture Screenshot
    Enter actionDate
    Capture Screenshot
    Input Remark    ${user['remark']}
    Sleep    2s
    Select Dropdown Value    //select[@id="action"]    ${user['action']}
    Capture Screenshot
    Click Next_Btn
    #Sleep    2s
    Capture Screenshot
PTP_Flow
    [Arguments]    ${user}
    Enter Due Date    ${user['dueDate']}
    Sleep    2s
    Capture Screenshot
    Input Installment Amount    ${user['InstallmentAmount']}
    Sleep    2s
    Capture Screenshot
    Select Payment Mode    ${user['PaymentMode']}
    Sleep    2s
    Capture Screenshot
    Input Remarks   ${user['remark']}
    Sleep    2s
    Capture Screenshot
    Click Save_Btn
    Sleep    5s
    Capture Screenshot
    Close PTP_Popups
    Capture Screenshot
Log_Out
    Click Logout
    Capture Screenshot
    Click Logout_Pop_Up_Yes Button
    Capture Screenshot

Capture Screenshot
    ${timestamp}=    Evaluate    (datetime.datetime.now()).strftime('%Y-%m-%d_%H-%M-%S')    modules=datetime
    ${filename}=    Catenate    ${SCREENSHOT_DIR}_${timestamp}.png
    Capture Page Screenshot    ${filename}

Get Timestamp
    Evaluate    (datetime.datetime.now()).strftime('${DATE_FORMAT}')    modules=datetime

Wait For Page To Load
    Wait Until Element Is Visible    //a[@id='relogin']    timeout=10s

Click Re_Login Button
    Click Element    //a[@id='relogin']

Input Username
    [Arguments]    ${username}
    Input Text    //input[@id='loginId']    ${username}

#Input Password
#    [Arguments]    ${password}
#    Input Text    //input[@id='password']    ${password}

Click Login Button
    Click Element    //button[@id='userLogin']


Click Pop_Up_Yes Button
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    //a[@id='popUpYes']    timeout=5s
    Run Keyword If    '${is_visible}' == 'True'    Click Element    //a[@id='popUpYes']
    Run Keyword If    '${is_visible}' == 'False'    Log    Pop-up did not appear within the timeout, skipping the action.
Wait For Menu To Load
    Wait Until Element Is Visible    //a[@class='item-nav']    timeout=10s

Click Menu Button
    Click Element    //a[@class='item-nav']

Click PRE LIQUIDATED CASES
    Wait Until Element Is Visible    //li[@id="PRELIQUID"]/a    timeout=10s
    Click Element    //li[@id="PRELIQUID"]/a

Select Arab National Bank
    Wait Until Element Is Visible    //span[@title="Arab National Bank"]    timeout=10s
    Click Element    //span[@title="Arab National Bank"]
    Capture Page Screenshot
Click Dispose All Button
    Click Button    //button[@id="disposeAllBtn1"]

Enter disposeDate
    ${current_datetime}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(hours=1)).strftime('%m-%d-%Y %H:%M:%S')    modules=datetime
    Log    Current date and time: ${current_datetime}
    Input Text    //input[@id='disposeDate']    ${current_datetime}
    Click Element    //select[@id="dispositionValue"]
Enter actionDate
    ${action_datetime}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(hours=1)).strftime('%m-%d-%Y %H:%M:%S')    modules=datetime
    Log    Action date and time: ${action_datetime}
    Input Text    //input[@id='actionDate']    ${action_datetime}
Select Dropdown Value
    [Arguments]    ${dropdown_locator}    ${value}
    Select From List By Value    ${dropdown_locator}    ${value}
Input Action Remark
    [Arguments]    ${actionRemark}
    Input Text    //input[@id='actionRemark']    ${actionRemark}

Click Add Action
    Click Element    //button[@id='saveData']
Click Logout
    Wait Until Element Is Visible    //li[@class="hil-logout"]/a    timeout=10s
    Click Element    //li[@class="hil-logout"]/a

Click Next_Btn
    Click Element    //div[@id="nextBtn"]

Click Logout_Pop_Up_Yes Button
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    //a[@id="logoutYes"]    timeout=5s
    Run Keyword If    ${is_visible}    Click Element    //a[@id="logoutYes"]

Wait For PopUp
    Wait Until Element Is Visible    //a[@id='popUpYes']    timeout=10s

Click RuleName
    [Arguments]    ${ruleName}
    Double Click Element    //td[text()='${ruleName}']
Click On CR
    [Arguments]    ${CR}
    Double Click Element    //td[text()='${CR}']
Select Value From Dropdown
	[Arguments]    ${dropdown_locator}    ${value_to_select}
    Select Dropdown Value    ${dropdown_locator}    ${value_to_select}
Input Remark
    [Arguments]    ${actionRemark}
    Input Text    //input[@id='remark']    ${actionRemark}

Input Remarks
    [Arguments]    ${actionRemark}
    Input Text    //textarea[@id='remarks']    ${actionRemark}

Select Checkbox By Label Text
    [Arguments]    ${label_text}
    Click Element    //div[@class='dropdown multi-select-drop']//label[text()="Select"]
    ${checkbox_xpath}=    Set Variable    //div[@class='dropdown-list']//label[contains(text(),'${label_text}')]//input[@type='checkbox']
    Wait Until Element Is Visible    ${checkbox_xpath}    timeout=5
    Click Element    ${checkbox_xpath}

Enter Due Date
    [Arguments]    ${element}
    Wait Until Element Is Visible    //input[@id='planDate']    timeout=5
    Click Element    //input[@id='planDate']
    Wait Until Element Is Visible    (//td[@data-date="${element}"])[last()]    timeout=5
    Click Element    (//td[@data-date="${element}"])[last()]

Input Installment Amount
    [Arguments]    ${installmentAmount}
    Input Text    //input[@id='plannedAmt']    ${installmentAmount}

Select Payment Mode
    [Arguments]    ${value}
    Select From List By Value    //select[@id="paymentMode"]    ${value}

Click Save_Btn
    Click Element    //div[@id="saveData"]

Scroll Element Into View
    [Arguments]    ${element}
    Execute JavaScript    arguments[0].scrollIntoView(true);    ${element}
Close PTP_Popups
    Execute Javascript    document.querySelector('a.mh-cross').click()