*** Settings ***
Library    SeleniumLibrary
#Library    ../../libraries/custom_selenium_keywords.py  # Import Python custom keywords
*** Variables ***
${assignedTo}
${serviceId}
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
    Sleep    2s
    Click on OK Button
    Sleep    1s
    Select Account Number
    Sleep    2s
    Click on Proceed Button
    Sleep    2s
    Select Address Type    ${user['addressTypeValue']}
    Sleep    2s
    Select Active InActive Type    ${user['activeInActive']}
    Sleep    2s
    Enter Flat No    ${user['flatNo']}
    Enter Building No    ${user['buildingNo']}
    Enter Nearest LandMark    ${user['nearestLandMark']}
    Enter Road Number   ${user['roadNumber']}
    Select Block Code   ${user['blockCode']}
    Sleep    1s
    Select Country    ${user['country']}
    Sleep    2s
    Select City Area    ${user['cityArea']}
    Sleep    2s
    Choose document
    Sleep    2s
    Click on Add Button
    Sleep    2s
    Click on Submit Button
    Click Pop_Up_Yes Button
    Sleep    4s
    Get value of assignedTo
    Get value of serviceId
    Sleep    4s
    Perform Logout Steps
    Click Re_Login Button
    Capture Screenshot
    Input Username    ${assignedTo}
    Click Login Button
    Click Pop_Up_Yes Button
    Sleep    2s
    Click on Servie Summary
    Sleep    3s
    Check Change Address Record Visible
    Sleep    3s
    Open ServiceId Request
    Sleep    3s
    Click On ApproveBtn
    Sleep    3s
    Open URL And Verify Change Address    ${user}

Block_Unblock
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
    Click Block_Unblock
    Enter Customer ID    ${user['customerID']}
    Click Search Customer Button
    Sleep    4s
    Select Customer Id
    Click on OK Button
    Sleep    4s
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
    Get value of assignedTo
    Get value of serviceId
    Sleep    4s
    Perform Logout Steps
    Click Re_Login Button
    Capture Screenshot
    Input Username    ${assignedTo}
    Click Login Button
    Click Pop_Up_Yes Button
    Sleep    2s
    Click on Servie Summary
    Sleep    5s
    Check Change Address Record Visible
    Sleep    3s
    Open ServiceId Request
    Sleep    3s
    Click On ApproveBtn
    Sleep    3s


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
    Wait Until Element Is Enabled    //input[@id="cifNo1"]    timeout=50s
    Click Element    //input[@id="cifNo1"]
    Capture Screenshot
Click on OK Button
    Wait Until Element Is Visible    //button[@id="okServiceProceed"]    timeout=5s
    Click Button    //button[@id="okServiceProceed"]
    Capture Screenshot

Select Account Number
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Enabled    //input[@id="accountNumber1"]    timeout=50s
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
Enter Building No
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="buildingNo"]    timeout=5s
    Run Keyword If    '${value}' != ''    Input Text    //input[@id="buildingNo"]    ${value}
    Capture Screenshot
Enter Nearest LandMark
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="nearLestLandMark"]    timeout=5s
    Input Text    //input[@id="nearLestLandMark"]    ${value}
    Capture Screenshot
Enter Road Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="streetNo"]    timeout=5s
    Input Text    //input[@id="streetNo"]    ${value}
    Capture Screenshot
Select Block Code
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="blockCode"]    timeout=5s
    Select From List By Value    //select[@id="blockCode"]    ${value}
    Capture Screenshot
Select Country
    [Arguments]    ${value}
    Select From List By Value    //select[@id="country"]    ${value}
    Capture Screenshot
Select City Area
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="governorate"]    timeout=5s
    Select From List By Value    //select[@id="governorate"]    ${value}
    Capture Screenshot
Click on Update Button
    Wait Until Element Is Visible    //button[@id="updatebt"]    timeout=5s
    Click Button    //button[@id="updatebt"]
    Capture Screenshot

Choose document
    Choose File    xpath=//input[@id="documentData" and @type="file"]    D:/New_automation_/web-automation-framework/tests/selenium-screenshot-1.png
    #Click Element  xpath=//button[@id="upload"]  # Click upload button (if required)

Click on Add Button
    Wait Until Element Is Visible    //button[@id="addbtnChangeAddress"]    timeout=5s
    Click Button    //button[@id="addbtnChangeAddress"]
    Sleep    2s
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
Get value of assignedTo
    Wait Until Element Is Visible    //tr[@role="row"][1]/td[7]    timeout=10s
    ${local_value}=    Get Text    //tr[@role="row"][1]/td[7]
    Set Global Variable    ${assignedTo}    ${local_value}
Get value of serviceId
    ${local_value}=    Get Text    //tr[@role="row"][1]/td[1]
    Set Global Variable    ${serviceId}    ${local_value}
Check Change Address Record Visible
    Element Should Be Visible    //tr[@role="row"][1]/td[text()="${serviceId}"]
    Element Should Be Visible    //tr[@role="row"][1]/td[text()="${assignedTo}"]
Open ServiceId Request
    Double Click Element    //tr[@role="row"][1]/td[text()="${serviceId}"]
    Capture Screenshot
Click On ApproveBtn
    Wait Until Element Is Visible    //button[@id="srApproveBtn"]    timeout=10s
    Click Element    //button[@id="srApproveBtn"]
    Capture Screenshot
Click Block_Unblock
    Wait Until Element Is Visible    //em[text()="Service"]    timeout=5s
    Click Element    //em[text()="Service"]
    Capture Screenshot
    Wait Until Element Is Visible    //em[text()=" Service Request"]    timeout=5s
    Click Element    //em[text()=" Service Request"]
    Capture Screenshot
    Wait Until Element Is Visible    //li[@id="BLOCKUNBLOCKSERVICE"]    timeout=5s
    Click Element    //li[@id="BLOCKUNBLOCKSERVICE"]
    Capture Screenshot
Click Repayment Mode
    Wait Until Element Is Visible    //em[text()="Service"]    timeout=5s
    Click Element    //em[text()="Service"]
    Capture Screenshot
    Wait Until Element Is Visible    //em[text()=" Service Request"]    timeout=5s
    Click Element    //em[text()=" Service Request"]
    Capture Screenshot
    Execute Javascript    document.querySelector('#REPAYMENTMODE').scrollIntoView(true);
    Wait Until Element Is Visible    //li[@id="REPAYMENTMODE"]    timeout=5s
    Click Element    //li[@id="REPAYMENTMODE"]
    Capture Screenshot
Select Change Repayment Mode
    [Arguments]    ${value}
    Select From List By Value    //select[@id="changeRepaymentMode"]    ${value}

Click on Repayment_Submit
    Sleep    2s
    Wait Until Element Is Visible    //button[@id="repaymentSubmit"]    timeout=5s
    Click Button    //button[@id="repaymentSubmit"]
    Capture Screenshot


Here’s how you can create a Robot Framework keyword to open a URL dynamically and check for expected text on the page:

Keyword Implementation
robot
Copy code

Open URL And Verify Repayment Mode
    [Arguments]    ${user}
    Close Browser
    Sleep    2s
    Open Browser    http://172.21.0.42:9091/Kiya.aiCBS-10.2.0    chrome
    Sleep    3s
    Maximize Browser Window
    Input Username    ${user['username2']}
    Sleep    1s
    Input Password    ${user['password']}
    Sleep    1s
    Click Login Button
    Wait Until Element Is Visible    //a[@data-original-title="Menu"]    timeout=10s
    Click Element    //a[@data-original-title="Menu"]
    Sleep    1s
    Wait Until Element Is Visible    //li[@id="CUST360"]    timeout=10s
    Click Element    //li[@id="CUST360"]
    Sleep    1s
    Input Text    //input[@id="cust360SearchId"]    ${user['customerID']}
    Sleep    1s
    Click Button    //button[@id="cust360F2"]
    Wait Until Element Is Visible    //h6[text()="Customer ID"]/following-sibling::label[text()="${user['customerID']}"]    timeout=20s
    Click on Account Details Tab
    Sleep    2s
    Click On Address Details
    Sleep    2s
    Verify Change Address Detail    ${user}
    Sleep    2s
    [Teardown]    Close Browser

Click on Account Details Tab
    Wait Until Element Is Visible    //button[@id="acctDetails"]    timeout=10s
    Click Button    //button[@id="acctDetails"]
    Sleep    1s
    Capture Screenshot

Click On Address Details
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    //h6[text()="Address Details"]     timeout=10s
    Click Element    //h6[text()="Address Details"]
    Capture Screenshot

Input Username
    [Arguments]    ${username}
    Input Text    //input[@id='loginId']    ${username}
    Capture Screenshot
Input Password
    [Arguments]    ${password}
    Input Text    //input[@id='uiPwd']    ${password}
    Capture Screenshot
Verify Change Address Detail
    [Arguments]    ${user}
     Wait Until Element Is Visible    //td[text()="${user['addressType']}"]     timeout=10s
     Log    ${user['addressType']} is visible
     Wait Until Element Is Visible    //td[text()="${user['addressType']}"]/following-sibling::td[1]     timeout=10s
     ${Address}=    Get Text    //td[text()="${user['addressType']}"]/following-sibling::td[1]
     ${flatNo_buildingNo}=     Set Variable    ${user['flatNo']}${user['buildingNo']}
     Run Keyword If    '${Address}' == '${flatNo_buildingNo}'    Log To Console    Address and flatNo_buildingNo are same.
     Run Keyword If    '${Address}' != '${flatNo_buildingNo}'    Fail    Avenue Road Lane and Road Number are different. Expected: ${Address}, Actual: ${flatNo_buildingNo}.
     ${Building_Villa}=    Get Text    //td[text()="${user['addressType']}"]/following-sibling::td[2]
     ${nearestLandMark}=     Set Variable    ${user['nearestLandMark']}
     Run Keyword If    '${Building_Villa}' == '${nearestLandMark}'    Log To Console    Building Villa and nearestLandMark are same.
     Run Keyword If    '${Building_Villa}' != '${nearestLandMark}'    Fail    Avenue Road Lane and Road Number are different. Expected: ${Building_Villa}, Actual: ${nearestLandMark}.
     ${Avenue_Road_Lane}=    Get Text    //td[text()="${user['addressType']}"]/following-sibling::td[3]
     ${roadNumber}=     Set Variable    ${user['roadNumber']}
     Run Keyword If    '${Avenue_Road_Lane}' == '${roadNumber}'    Log To Console    Avenue Road Lane and Road Number are same.
     Run Keyword If    '${Avenue_Road_Lane}' != '${roadNumber}'    Fail    Avenue Road Lane and Road Number are different. Expected: ${roadNumber}, Actual: ${Avenue_Road_Lane}.
     ${Block}=    Get Text    //td[text()="${user['addressType']}"]/following-sibling::td[5]
     ${blockCode}=     Set Variable    ${user['blockCode']}
     Run Keyword If    '${blockCode}' == '${Block}'    Log To Console    Avenue Road Lane and Road Number are same.
     Run Keyword If    '${Avenue_Road_Lane}' != '${roadNumber}'    Fail    Avenue Road Lane and Road Number are different. Expected: ${Block}, Actual: ${blockCode}'.
     Capture Screenshot

Select Address Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="addressType"]     timeout=10s
    Select From List By Value    //select[@id="addressType"]    ${value}

Select Active InActive Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="activeInActiveType"]     timeout=10s
    Select From List By Value    //select[@id="activeInActiveType"]    ${value}