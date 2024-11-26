*** Settings ***
Library    SeleniumLibrary
Library    ../../libraries/custom_selenium_keywords.py  # Import Python custom keywords

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
    Select Arab National Bank
    Capture Screenshot
    Click Pre DPD =>180
    Sleep    4s
    Capture Screenshot
    Click On CR
    Sleep    4s
    Capture Screenshot
    Select Dropdown Value    //select[@id="disposition"]    ${user['disposition']}
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
    Capture Screenshot
    Select Dropdown Value    //select[@id="action"]    ${user['action']}
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
    #${current_datetime}=    Get Current Date    ${DATE_FORMAT}
    ${current_datetime}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(hours=1)).strftime('%m-%d-%Y %H:%M:%S')    modules=datetime
    Log    Current date and time: ${current_datetime}

    # Input the current datetime into the input field
    Input Text    //input[@id='disposeDate']    ${current_datetime}
    Click Element    //select[@id="dispositionValue"]
Enter actionDate
    #${current_datetime}=    Get Current Date    ${DATE_FORMAT}
    ${current_datetime}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(hours=1)).strftime('%m-%d-%Y %H:%M:%S')    modules=datetime
    Log    Current date and time: ${current_datetime}

    # Input the current datetime into the input field
    Input Text    //input[@id='actionDate']    ${current_datetime}
    #Click Element    //select[@id="dispositionValue"]
Select Dropdown Value
    [Arguments]    ${dropdown_locator}    ${value}
    Select From List By Value    ${dropdown_locator}    ${value}
Input Action Remark
    [Arguments]    ${actionRemark}
    Input Text    //input[@id='actionRemark']    ${actionRemark}

Click Add Action
    Click Element    //button[@id='saveData']
Click Logout
    Click Element    //li[@class="hil-logout"]/a

Click Logout_Pop_Up_Yes Button
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    //a[@id="logoutYes"]    timeout=5s
    Run Keyword If    ${is_visible}    Click Element    //a[@id="logoutYes"]

Wait For PopUp
    Wait Until Element Is Visible    //a[@id='popUpYes']    timeout=10s

Click Pre DPD =>180
    Double Click Element    //td[text()="Pre DPD =>180"]
Click On CR
    Double Click Element    //td[text()="4032025287"]
Select Value From Dropdown
	[Arguments]    ${dropdown_locator}    ${value_to_select}
    Select Dropdown Value    ${dropdown_locator}    ${value_to_select}
Input Remark
    [Arguments]    ${actionRemark}
    Input Text    //input[@id='remark']    ${actionRemark}
