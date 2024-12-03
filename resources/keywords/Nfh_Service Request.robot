*** Settings ***
Library    SeleniumLibrary
#Library    ../../libraries/custom_selenium_keywords.py  # Import Python custom keywords

*** Keywords ***
Change Address
	[Arguments]    ${user}
    Wait For Page To Load
    Capture Screenshot
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Wait For Menu To Load
    Capture Screenshot
    Click Menu Button
    Capture Screenshot
    Click Change Address
    #Select ID Type    ${user['IdType']}
    Enter Customer ID    ${user['customerID']}
    Click Search Customer Button
    Select Customer Id
    Click on OK Button
    Select Account Number
    Sleep    2s
    Click on Proceed Button
    #Click on Update Button
    Enter Flat No    ${user['flatNo']}
    Sleep    2s
    Choose document
    Sleep    2s
    Click on Add Button
    Sleep    2s
    Click on Submit Button
    Click Pop_Up_Yes Button
    Sleep    4s
    Perform Logout Steps
    Click Re_Login Button
    Capture Screenshot
    Input Username    ${user['username2']}
    Click Login Button
    Click Pop_Up_Yes Button
    Sleep    2s
    Click on Servie Summary
    Sleep    5s
Wait For Page To Load
    Wait Until Element Is Visible    //input[@id='loginId']    timeout=10s
    Capture Screenshot
Click Login Button
    Click Element    //button[@id='userLogin']
    Capture Screenshot
Click Pop_Up_Yes Button
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    //a[@id='popUpYes']    timeout=5s
    Run Keyword If    '${is_visible}' == 'True'    Click Element    //a[@id='popUpYes']
    Run Keyword If    '${is_visible}' == 'False'    Log    Pop-up did not appear within the timeout, skipping the action.
    Capture Screenshot
Wait For Menu To Load
    Wait Until Element Is Visible    //a[@class='item-nav']    timeout=10s
    Capture Screenshot
Capture Screenshot
    ${timestamp}=    Evaluate    (datetime.datetime.now()).strftime('%Y-%m-%d_%H-%M-%S')    modules=datetime
    ${filename}=    Catenate    ${SCREENSHOT_DIR}_${timestamp}.png
    Capture Page Screenshot    ${filename}

Click Menu Button
    Click Element    //a[@class='item-nav']
    Capture Screenshot
Click Change Address
    Wait Until Element Is Visible    //em[text()="Service"]    timeout=5s
    Click Element    //em[text()="Service"]
    Capture Screenshot
    Wait Until Element Is Visible    //em[text()=" Service Request"]    timeout=5s
    Click Element    //em[text()=" Service Request"]
    Capture Screenshot
    Wait Until Element Is Visible    //li[@id="CHANGEADDRESS"]    timeout=5s
    Click Element    //li[@id="CHANGEADDRESS"]
    Capture Screenshot
Select ID Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="nationalIdType"]    timeout=5s
    Select From List By Value    //select[@id="nationalIdType"]    ${value}
    Capture Screenshot
Enter ID Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="nationalIdType"]    timeout=5s
    Input Text    //input[@id='loginId']    ${username}
    Capture Screenshot
Enter Customer ID
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="cifNo"]    timeout=5s
    Input Text    //input[@id="cifNo"]    ${value}
    Capture Screenshot
Click Search Customer Button
    Wait Until Element Is Visible    //button[@id="serviceCustSearch"]    timeout=5s
    Click Element    //button[@id="serviceCustSearch"]
    Capture Screenshot
Select Customer Id
    Wait Until Element Is Visible    //input[@id="cifNo1"]    timeout=5s
    Click Element    //input[@id="cifNo1"]
    Capture Screenshot
Click on OK Button
    Wait Until Element Is Visible    //button[@id="okServiceProceed"]    timeout=5s
    Click Button    //button[@id="okServiceProceed"]
    Capture Screenshot

Select Account Number
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    //input[@id="accountNumber1"]    timeout=5s
    Click Element    //input[@id="accountNumber1"]
    Capture Screenshot
Click on Proceed Button
    Wait Until Element Is Visible    //button[@id="proceedAccData"]    timeout=5s
    Click Button    //button[@id="proceedAccData"]
    Capture Screenshot

Enter Flat No
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="flatNo"]    timeout=5s
    Input Text    //input[@id="flatNo"]    ${value}
    Capture Screenshot

Click on Update Button
    Wait Until Element Is Visible    //button[@id="updatebt"]    timeout=5s
    Click Button    //button[@id="updatebt"]
    Capture Screenshot

Choose document
    Choose File    xpath=//input[@id="documentData" and @type="file"]    C:/Users/akarshit.raj/Pictures/Screenshots/Screenshot (1).png
    #Click Element  xpath=//button[@id="upload"]  # Click upload button (if required)

Click on Add Button
    Wait Until Element Is Visible    //button[@id="addbtnChangeAddress"]    timeout=5s
    Click Button    //button[@id="addbtnChangeAddress"]
    Capture Screenshot

Click on Submit Button
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    //button[@id="changeAddressDetailsSubmit"]    timeout=5s
    Click Button    //button[@id="changeAddressDetailsSubmit"]
    Capture Screenshot

Perform Logout Steps
    Click Logout
    Capture Screenshot
    Click Logout_Pop_Up_Yes Button
    Capture Screenshot

Click Logout
    Wait Until Element Is Visible    //li[@class="hil-logout"]/a    timeout=10s
    Click Element    //li[@class="hil-logout"]/a

Click Logout_Pop_Up_Yes Button
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    //a[@id="logoutYes"]    timeout=5s
    Run Keyword If    ${is_visible}    Click Element    //a[@id="logoutYes"]
Click Re_Login Button
    Click Element    //a[@id='relogin']
    Capture Screenshot

Click on Servie Summary
    Wait Until Element Is Visible    (//a[@class="item-servieSummary"])[1]    timeout=5s
    Click Element    (//a[@class="item-servieSummary"])[1]
    Capture Screenshot