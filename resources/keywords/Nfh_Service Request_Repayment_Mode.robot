*** Settings ***
Library    SeleniumLibrary
#Library    ../../libraries/custom_selenium_keywords.py  # Import Python custom keywords
*** Variables ***
${assignedTo}
${serviceId}
*** Keywords ***


Repayment_Mode_EFT
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
    Click Repayment Mode
    Enter Customer ID    ${user['customerID']}
    Click Search Customer Button
    Sleep    2s
    Select Customer Id
    Sleep    2s
    Click on OK Button
    Sleep    5s
    Select Account Number
    Sleep    2s
    Click on Proceed Button
    Select Repayment Mode    ${user['changeRepaymentMode']}
    Sleep    2s
    Click on Add New
    Sleep    2s
    Enter Bank Name Code    ${user['bank_Name_Code']}
    Sleep    2s
    Enter Bank Account Number   ${user['bankAccountNumber']}
    Sleep    2s
    Enter IBAN Number   ${user['IBANNumber']}
    Sleep    2s
    Enter Monthly Installment   ${user['monthlyInstallment']}
    Sleep    2s
    Select Payment Frequency    ${user['paymentFrequency']}
    Sleep    2s
    Enter First Payment Date    ${user['firstPaymentDate']}
    Sleep    2s
    Enter Last Payment Date    ${user['lastPaymentDate']}
    Sleep    2s
    Enter Maximum Payment Amount    ${user['maximumPaymentAmount']}
    Sleep    2s
    Click on Add Button
    Sleep    2s
    Choose document
    Sleep    2s
    Click on Repayment_Submit
    Sleep    2s
    Click Pop_Up_Yes Button
    Sleep    4s
    Select Group Name    ${user['grpName']}
    Select User name    ${user['assignUser']}
    Enter Maker Remarks    ${user['makerRemarks']}
    Click on User Assign Save
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
    Sleep    10s
    Open URL And Verify Repayment Mode    ${user}

Repayment_Mode_Cash
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
    Click Repayment Mode
    Enter Customer ID    ${user['customerID']}
    Click Search Customer Button
    Sleep    2s
    Select Customer Id
    Sleep    2s
    Click on OK Button
    Sleep    5s
    Select Account Number
    Sleep    2s
    Click on Proceed Button
    Select Repayment Mode    ${user['changeRepaymentMode']}
    Wait Until Element Is Visible    xpath=//a[@id="DeactivateEftHyperlInk"]    timeout=10s
    Click Element    xpath=//a[@id="DeactivateEftHyperlInk"]
    Wait Until Element Is Visible    xpath=//button[@id="fetchEFTDetails"]    timeout=10s
    Click Element    xpath=//button[@id="fetchEFTDetails"]
    Wait Until Element Is Visible    xpath=//input[@type="checkbox"]    timeout=10s
    ${checkbox_present}=    Run Keyword And Return Status    Element Exists    xpath=//input[@type="checkbox"]
    Run Keyword If    '${checkbox_present}' == 'True'    Click Element    xpath=//input[@type="checkbox"]
    Choose document
    Sleep    2s
    Click on Repayment_Submit
    Sleep    2s
    Click Pop_Up_Yes Button
    Sleep    4s
    Select Group Name    ${user['grpName']}
    Select User name    ${user['assignUser']}
    Enter Maker Remarks    ${user['makerRemarks']}
    Click on User Assign Save
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
    Sleep    10s
    Open URL And Verify Repayment Mode    ${user}

Service_Repayment_Mode_PDC
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
    Click Repayment Mode
    Enter Customer ID    ${user['customerID']}
    Click Search Customer Button
    Sleep    2s
    Select Customer Id
    Sleep    2s
    Click on OK Button
    Sleep    5s
    Select Account Number
    Sleep    2s
    Click on Proceed Button
    Select Repayment Mode    ${user['changeRepaymentMode']}
    Wait Until Element Is Visible    xpath=//a[@id="newPDCDivHyperlink"]    timeout=10s
    Click Element    xpath=//a[@id="newPDCDivHyperlink"]
    Select PDC Bank    ${user['PDCBank']}
    Enter PDC Bank Account Number    ${user['bankAccountNumber']}
    Enter Deposit Account Number    ${user['depositAccountNumber']}
    Enter PDC Start Date    ${user['PDCStartDate']}
    Enter Starting PDC No    ${user['StartingPDCNo']}
    Enter No of PDC    ${user['noOfPDC']}
    Sleep    2s
    Click Element    //input[@id="pdcEndNo"]
    Click Element    //button[@id="addbtn"]
    #Click on Add Button
    Choose document
    Click on Repayment_Submit
    Sleep    2s
    Click Pop_Up_Yes Button
    Select Group Name    ${user['grpName']}
    Select User name    ${user['assignUser']}
    Enter Maker Remarks    ${user['makerRemarks']}
    Click on User Assign Save
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
    Sleep    10s
    Open URL And Verify Repayment Mode    ${user}
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
Scroll Element Into View
    [Arguments]    ${element_xpath}
    Execute Javascript    arguments[0].scrollIntoView(true);    ${element_xpath}
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

Select Repayment Mode
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="changeRepaymentMode"]    timeout=5s
    Select From List By Value    //select[@id="changeRepaymentMode"]    ${value}
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
    Wait Until Element Is Visible    //input[@id="cifNo1"]    timeout=50s
    Wait Until Element Is Enabled    //input[@id="cifNo1"]    timeout=5s
    Click Element    //input[@id="cifNo1"]
    Capture Screenshot
Click on OK Button
    Wait Until Element Is Visible    //button[@id="okServiceProceed"]    timeout=5s
    Click Button    //button[@id="okServiceProceed"]
    Capture Screenshot

Select Account Number
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Enabled    //input[@id="accountNumber1"]    timeout=50s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
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

Click on Add Button
    Wait Until Element Is Visible    //button[@id="addbt"]    timeout=5s
    Click Button    //button[@id="addbt"]
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
    Wait Until Element Is Visible    //tr[@role="row"][1]/td[7]    timeout=50s
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
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
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
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    #Scroll Element Into View    //button[@id="repaymentSubmit"]
    Wait Until Element Is Enabled    //button[@id="repaymentSubmit"]    timeout=5s
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
    Click On Account Details    ${user['repayment_Mode']}

Click On Address Details
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    //h6[text()="Address Details"]     timeout=10s
    Click Element    //h6[text()="Address Details"]
    Capture Screenshot

Input Username
    [Arguments]    ${username}
	Log    Input User name ${username}
    Input Text    //input[@id='loginId']    ${username}
    Capture Screenshot
    Click Element    //input[@id='uiPwd']

Input Password
    [Arguments]    ${password}
    Input Text    //input[@id='uiPwd']    ${password}
    Capture Screenshot

Select Address Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="addressType"]     timeout=10s
    Select From List By Value    //select[@id="addressType"]    ${value}

Select Active InActive Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="activeInActiveType"]     timeout=10s
    Select From List By Value    //select[@id="activeInActiveType"]    ${value}

Click on Add New
    Wait Until Element Is Visible    //a[text()="Add new EFT"]     timeout=10s
    Click Element    //a[text()="Add new EFT"]
    Capture Screenshot
    Wait Until Element Is Visible    //a[text()="Add New"]     timeout=10s
    Click Element    //a[text()="Add New"]
    Capture Screenshot

Enter Bank Name Code
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="bankNameCode"]    timeout=5s
    Input Text    //input[@id="bankNameCode"]    ${value}
    Capture Screenshot

Enter Bank Account Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="bankAccountNumber"]    timeout=5s
    Input Text    //input[@id="bankAccountNumber"]    ${value}
    Capture Screenshot

Enter IBAN Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="ibanNumber"]    timeout=5s
    Input Text    //input[@id="ibanNumber"]    ${value}
    Capture Screenshot

Enter Monthly Installment
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="monthlyInstallment"]    timeout=5s
    Input Text    //input[@id="monthlyInstallment"]    ${value}
    Capture Screenshot

Select Payment Frequency
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="paymentFrequency"]     timeout=10s
    Select From List By Value    //select[@id="paymentFrequency"]    ${value}

Enter First Payment Date
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="firstPaymentDate"]    timeout=5s
    Input Text    //input[@id="firstPaymentDate"]    ${value}
    Capture Screenshot

Enter Last Payment Date
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="lastPaymentDate"]    timeout=5s
    Input Text    //input[@id="lastPaymentDate"]    ${value}
    Capture Screenshot

Enter Maximum Payment Amount
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="maximumPaymentAmount"]    timeout=5s
    Input Text    //input[@id="maximumPaymentAmount"]    ${value}
    Capture Screenshot
Choose document
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Choose File    xpath=//input[@id="consentDocData" and @type="file"]    D:/New_automation_/web-automation-framework/tests/selenium-screenshot-1.png
    #Click Element  xpath=//button[@id="upload"]  # Click upload button (if required)

Click On Account Details
    [Arguments]    ${value}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    //button[text()="Account Details"]     timeout=10s
    Click Element    //button[text()="Account Details"]
    Sleep   1s
    Wait Until Element Is Visible    //h6[text()="Account Details"]     timeout=10s
    Click Element    //h6[text()="Account Details"]
    Sleep   1s
    Wait Until Element Is Visible    //table[@id="dt-custAccountsList"]/tbody/tr[1]/td[2]/a     timeout=10s
    Click Element    //table[@id="dt-custAccountsList"]/tbody/tr[1]/td[2]/a
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep   1s
    Wait Until Element Is Visible    (//a[text()="Loan Details"])[1]     timeout=10s
    Click Element    (//a[text()="Loan Details"])[1]
    Sleep   1s
    Wait Until Element Is Visible    //h6[@id="loanOverViewLbl"]     timeout=10s
    Click Element    //h6[@id="loanOverViewLbl"]
    Sleep   1s
    #${Actual_Repayment_Mode}=    Get Text    //tr[@role="row"][1]/td[7]
    ${Actual_Repayment_Mode}=    Get Text    //h6[text()="Repayment Mode"]/following-sibling::label
    ${Expected_Repayment_Mode}=     Set Variable    ${value}
     Run Keyword If    '${Actual_Repayment_Mode}' == '${Expected_Repayment_Mode}'    Log To Console    Repayment_Mode is same.
     Run Keyword If    '${Actual_Repayment_Mode}' != '${Expected_Repayment_Mode}'    Fail    Repayment_Mode is different. Expected: ${Actual_Repayment_Mode}, Actual: ${Expected_Repayment_Mode}'.
     Capture Screenshot
    Capture Screenshot

Select PDC Bank
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="pdcBank"]    timeout=5s
    Select From List By Value    //select[@id="pdcBank"]    ${value}
    Capture Screenshot
Enter PDC Bank Account Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="pdcBankAccountNumber"]    timeout=5s
    Input Text    //input[@id="pdcBankAccountNumber"]    ${value}
    Capture Screenshot
Enter Deposit Account Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="depositBankNumber"]    timeout=5s
    Input Text    //input[@id="depositBankNumber"]    ${value}
    Capture Screenshot
Enter PDC Start Date
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="pdcStartDate"]    timeout=5s
    Input Text    //input[@id="pdcStartDate"]    ${value}
    Capture Screenshot
Enter Starting PDC No
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="pdcStartNo"]    timeout=5s
    Input Text    //input[@id="pdcStartNo"]    ${value}
    Capture Screenshot

Enter No of PDC
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="pdcNos"]    timeout=5s
    Input Text    //input[@id="pdcNos"]    ${value}
    Capture Screenshot
Select Group Name
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="grpName"]     timeout=10s
    Select From List By Value    //select[@id="grpName"]    ${value}
Select User name
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="assignUser"]     timeout=10s
    Select From List By Value    //select[@id="assignUser"]    ${value}
Enter Maker Remarks
    [Arguments]    ${value}
    Wait Until Element Is Visible    //textarea[@id="makerRemarks"]    timeout=5s
    Input Text    //textarea[@id="makerRemarks"]    ${value}
    Capture Screenshot
Click on User Assign Save
    Wait Until Element Is Enabled    //a[@id="userAssignSave"]    timeout=50s
    Click Element    //a[@id="userAssignSave"]
    Capture Screenshot