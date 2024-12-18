*** Settings ***
Library    SeleniumLibrary
#Library    ../../libraries/custom_selenium_keywords.py  # Import Python custom keywords
*** Variables ***
${assignedTo}
${serviceId}
*** Keywords ***


Lead_Creation_flow
	[Arguments]    ${user}
    Wait For Page To Load
    Capture Screenshot
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click New Lead
    Select ID Type    ${user['IDType']}
    Enter ID Number    ${user['IDNumber']}
    Select Customer Type    ${user['CustomerType']}
    Enter First Name    ${user['FirstName']}
    Enter Second Name    ${user['SecondName']}
    Enter Family Name    ${user['FamilyName']}
    Enter Mobile Number    ${user['MobileNumber']}
    Select Product    ${user['Product']}
    Select Sub Product    ${user['SubProduct']}
    Select Scheme Type    ${user['SchemeType']}
    Select Branch    ${user['Branch']}
    Click on Save
    #Click on Convert To App
    Click on Lead List
    Click on Lead    ${user['IDNumber']}
    Click on Convert To App
    Click warningPop_Up_Yes Button
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click on Detail Data Entry
    Select ID Type    ${user['IDType']}
    Enter ID Number    ${user['IDNumber']}

Lead_Creation_KYC
    [Arguments]    ${user}
    Wait For Page To Load
    Capture Screenshot
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Detail Data Entry
    Click on KYC
    Click on Edit Icon
    #Select ID Type    ${user['IDType']}
    #Enter ID Number    ${user['IDNumber']}
    Select Applicant Type    ${user['ApplicantType']}
    Enter Email Id    ${user['email']}
    Select Source Of Income    ${user['ApplicantType']}
    Execute Javascript    window.scrollBy(0, 300);
    Select Title    ${user['Title']}
    Select Nationality    ${user['Nationality']}
    Select Country Of Jurisdiction    ${user['countryOfJurisdiction']}
    Select educationLevel    ${user['EducationLevel']}
    Sleep    5s
    #Enter Dob    ${user['DateOfBirth']}
    Select Date From Date Picker    ${user['DateOfBirth']}
    Sleep    5s
    Select educationLevel    ${user['EducationLevel']}
    Select Marital Status    ${user['MaritalStatus']}
    Enter No Of Dependents    ${user['NoOfDependents']}
    Select Returned Cheques    ${user['ReturnedCheques']}
    Select Cheque Abuser List    ${user['ChequeAbuserList']}
    Click on Save Basic
    Sleep    5s
    Address Details    ${user}
    Identification Details    ${user}
    Employment Details    ${user}
    Bank Details    ${user}
Address Details
    [Arguments]    ${user}
    Close Browser
    Sleep    2s
    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
    Sleep    3s
    Maximize Browser Window
    Wait For Page To Load
    Capture Screenshot
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Detail Data Entry
    Click on KYC
    Click Address Details
    Select Address Type    ${user['addressType']}
    Select Property ownership    ${user['PropertyOwnership']}
    Enter Address Line1    ${user['addressLine1']}
    Enter flat    ${user['flat']}
    Enter Building    ${user['building']}
    Enter Avenue    ${user['avenue']}
    Select Block    ${user['Block']}
    Select Country    ${user['Country']}
    Select City_Area    ${user['City_Area']}
    Click Is PermantAdd
    Click on Save Address

Identification Details
    [Arguments]    ${user}
    Close Browser
    Sleep    2s
    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
    Sleep    3s
    Maximize Browser Window
    Wait For Page To Load
    Capture Screenshot
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Detail Data Entry
    Click on KYC
    Click Identification Details
    Click on Edit Icon IdentifiDetails
    #Click Identification Details
    Enter Issue Date    ${user['issueDate']}
    Enter Expiry Date    ${user['expiryDate']}
    Select Renewal Under Process    ${user['renewalUnderProcess']}
    Click on Save Identy
Employment Details
    [Arguments]    ${user}
    Close Browser
    Sleep    2s
    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
    Sleep    3s
    Maximize Browser Window
    Wait For Page To Load
    Capture Screenshot
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Detail Data Entry
    Click on KYC
    Click Employment Details
    Select Nature of Emplmt    ${user['natureOfEmplmt']}
    Select Income Type    ${user['incomeType']}
    Enter Income Amt    ${user['incomeType']}
    Click on Add Income
    Sleep    5s
Bank Details
    [Arguments]    ${user}
    Close Browser
    Sleep    2s
    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
    Sleep    3s
    Maximize Browser Window
    Wait For Page To Load
    Capture Screenshot
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Detail Data Entry
    Click on KYC
    Click Bank Details
    Select Bank Name	${user['bankName']}
    Enter Account Number	${user['accountNumber']}
    Enter IBAN Number	${user['ibanNumber']}
    Click on Save Bank
Wait For Page To Load
	Log    Wait Until Element Is Visible
    Wait Until Element Is Visible    //input[@id='loginId']    timeout=10s
    Capture Screenshot

Capture Screenshot
    ${timestamp}=    Evaluate    (datetime.datetime.now()).strftime('%Y-%m-%d_%H-%M-%S')    modules=datetime
    ${filename}=    Catenate    ${SCREENSHOT_DIR}_${timestamp}.png
    Capture Page Screenshot    ${filename}

Input Username
    [Arguments]    ${username}
	Log    Input User name ${username}
    Input Text    //input[@id='loginId']    ${username}
    Capture Screenshot

Click Login Button
	Wait Until Element Is Visible    //button[@id='userLogin']    timeout=10s
	Log    Clicking on Login button
    Click Element    //button[@id='userLogin']
    Capture Screenshot

Click Pop_Up_Yes Button
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    //a[@id='popUpYes']    timeout=5s
    Run Keyword If    '${is_visible}' == 'True'    Click Element    //a[@id='popUpYes']
    Run Keyword If    '${is_visible}' == 'False'    Log    Pop-up did not appear within the timeout, skipping the action.
    Capture Screenshot

Click New Lead
    Wait Until Element Is Visible    //a[@data-original-title="New Lead"]    timeout=10s
    Log    Clicking on New Log Logo
    Click Element    //a[@data-original-title="New Lead"]
    Capture Screenshot

Click Inbox
    Wait Until Element Is Visible    //a[@data-original-title="Inbox"]    timeout=10s
    Log    Clicking on Inbox Logo
    Click Element    //a[@data-original-title="Inbox"]
    Capture Screenshot

Select ID Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="idType"]    timeout=5s
    Log    Selecting ID Type
    Select From List By Value    //select[@id="idType"]    ${value}
    Capture Screenshot

Enter ID Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="idNumber"]    timeout=5s
    Input Text    //input[@id="idNumber"]    ${value}
    Capture Screenshot

Select Customer Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="custType"]    timeout=5s
    Log    Selecting Customer Type
    Select From List By Value    //select[@id="custType"]    ${value}
    Capture Screenshot

Enter First Name
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="fName"]    timeout=5s
    Log    Enter the value of First Name
    Input Text    //input[@id="fName"]    ${value}
    Capture Screenshot

Enter Second Name
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="sName"]    timeout=5s
    Log    Enter the value of Second Name
    Input Text    //input[@id="sName"]    ${value}
    Capture Screenshot

Enter Family Name
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="famName"]    timeout=5s
    Log    Enter the value of Family Name
    Input Text    //input[@id="famName"]    ${value}
    Capture Screenshot

Enter Mobile Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="mobileNo"]    timeout=5s
    Log    Enter the mobile number..
    Input Text    //input[@id="mobileNo"]    ${value}
    Capture Screenshot

Select Product
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="product"]    timeout=5s
    Log    Selecting Product
    Select From List By Value    //select[@id="product"]    ${value}
    Capture Screenshot

Select Sub Product
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="subProduct"]    timeout=5s
    Log    Selecting Sub Product
    Wait Until Element Is Visible    //select[@id="subProduct"] /option[@value="${value}"]    timeout=5s
    Select From List By Value    //select[@id="subProduct"]    ${value}
    Capture Screenshot

Select Scheme Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="scheme"]    timeout=5s
    Log    Selecting Scheme Type
    Wait Until Element Is Visible    //select[@id="scheme"]/option[@value="${value}"]    timeout=5s
    Select From List By Value    //select[@id="scheme"]    ${value}
    Capture Screenshot

Select Branch
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="nearestBranch"]    timeout=5s
    Log    Selecting Branch
    Wait Until Element Is Visible    //select[@id="nearestBranch"]/option[@value="${value}"]    timeout=5s
    Select From List By Value    //select[@id="nearestBranch"]    ${value}
    Capture Screenshot

Click on Save
    Wait Until Element Is Visible    //button[@id="saveData"]    timeout=10s
    Log    Clicking on Save Button
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2s
    Click Button    //button[@id="saveData"]
    Sleep    2s
    Capture Screenshot

Click on Convert To App
    Wait Until Element Is Visible    //button[@id="convertpreLeadToApp"]    timeout=10s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Log    Clicking on Convert To App
    Click Button    //button[@id="convertpreLeadToApp"]
    Sleep    2s
    Capture Screenshot

Click on Lead List
    Sleep    5s
    Wait Until Element Is Visible    //a[@data-original-title="Lead List"]     timeout=10s
    Log    Clicking on Lead List
    Click Element    //a[@data-original-title="Lead List"]
    Capture Screenshot

Click on Lead
    [Arguments]    ${value}
    Wait Until Element Is Visible    (//tr[@role="row"]/td[text()="${value}"])[1]     timeout=10s
    #${local_value}=    Get Text    (//tr[td[3][contains(text(), '${value}')]]/td[1])[1]
    #Log    Clicking on Lead ${local_value}
    Double Click Element    (//tr[@role="row"]/td[text()="${value}"])[1]
    Capture Screenshot

Click warningPop_Up_Yes Button
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    //a[@id="warningPopYesConvertAp"]    timeout=5s
    Run Keyword If    '${is_visible}' == 'True'    Click Element    //a[@id="warningPopYesConvertAp"]
    Run Keyword If    '${is_visible}' == 'False'    Log    Pop-up did not appear within the timeout, skipping the action.
    Capture Screenshot

Click on Pull
    [Arguments]    ${value}
    Wait Until Element Is Visible    //tr[td[3][contains(text(), '${value}')]]/td[1]       timeout=10s
    Log    Clicking on Pull ${value}
    Double Click Element    //tr[td[3][contains(text(), '${value}')]]/td[1]
    Capture Screenshot

Click on Detail Data Entry
    Wait Until Element Is Visible    //a[contains(text(), 'Detail Data Entry')]    timeout=10s
    Log    Clicking on Detail Data Entry
    #Scroll Element Into View    //a[contains(text(), 'Detail Data Entry')]
    Sleep    2s
    #Click Element    //a[contains(text(), 'Detail Data Entry')]
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Detail Data Entry')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    #Execute JavaScript    arguments[0].click();    //a[contains(text(), 'Detail Data Entry')]
    Sleep    2s
    Capture Screenshot
Click on KYC
    Wait Until Element Is Visible    //a[contains(text(), 'KYC')]    timeout=10s
    Log    Clicking on KYC
    #Scroll Element Into View    //a[contains(text(), 'Detail Data Entry')]
    Sleep    2s
    #Click Element    //a[contains(text(), 'Detail Data Entry')]
    Execute JavaScript    document.evaluate("//a[contains(text(), 'KYC')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    #Execute JavaScript    arguments[0].click();    //a[contains(text(), 'Detail Data Entry')]
    Sleep    2s
    Capture Screenshot

Scroll Element Into View
    [Arguments]    ${locator}
    #${element}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].scrollIntoView(true);    ${locator}


Click on Edit Icon
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewBasicDetailsFrame"]
    Wait Until Element Is Visible    //a[@class="btn sm btn-info px-1 py-0 editBtn"][last()]     timeout=10s
    Sleep    3s
    Click Element    //a[@class="btn sm btn-info px-1 py-0 editBtn"][last()]
    Capture Screenshot
    Sleep    3s
Click on Edit Icon IdentifiDetails
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewIdentifiDetailsIdFrame"]
    Wait Until Element Is Visible    //a[@class="btn sm btn-info px-1 py-0 editBtn"][last()]     timeout=10s
    Sleep    3s
    Click Element    //a[@class="btn sm btn-info px-1 py-0 editBtn"][last()]
    Capture Screenshot
    Sleep    3s

Select Applicant Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="applicantType"]    timeout=5s
    Log    Selecting Applicant Type
    Select From List By Value    //select[@id="applicantType"]    ${value}
    Capture Screenshot

Enter Email Id
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="email"]    timeout=5s
    Log    Enter the Email Id
    Input Text    //input[@id="email"]    ${value}
    Capture Screenshot

Select Source Of Income
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="activityNote"]    timeout=5s
    Log    Selecting Applicant Type
    Select From List By Value    //select[@id="activityNote"]    ${value}
    Capture Screenshot

Select Title
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="custPrefix"]    timeout=5s
    Log    Selecting Title
    Select From List By Value    //select[@id="custPrefix"]    ${value}
    Capture Screenshot

Select Nationality
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="nationality"]    timeout=5s
    Log    Selecting Nationality
    Select From List By Value    //select[@id="nationality"]    ${value}
    Capture Screenshot
Select Country Of Jurisdiction
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="countryOfJurisdiction"]    timeout=5s
    Log    Selecting Jurisdiction
    Select From List By Value    //select[@id="countryOfJurisdiction"]    ${value}
    Capture Screenshot
Select educationLevel
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="educationLevel"]    timeout=5s
    Log    Selecting educationLevel
    Select From List By Value    //select[@id="educationLevel"]    ${value}
    Capture Screenshot

Enter Dob
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="dob"]    timeout=5s
    Log    Enter Date of birth..
    Clear Element Text    //input[@id="dob"]
    Input Text    //input[@id="dob"]    ${value}
    Capture Screenshot

Select Marital Status
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="maritalSts"]    timeout=5s
    Log    Selecting Marital Status
    Select From List By Value    //select[@id="maritalSts"]    ${value}
    Capture Screenshot
Enter No Of Dependents
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="noOfDependents"]    timeout=5s
    Log    Enter No Of Dependents
    Input Text    //input[@id="noOfDependents"]    ${value}
    Capture Screenshot
Select Returned Cheques
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="returnedCheques"]    timeout=5s
    Log    Selecting Returned Cheques
    Select From List By Value    //select[@id="returnedCheques"]    ${value}
    Capture Screenshot
Select Cheque Abuser List
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="chequeAbuserList"]    timeout=5s
    Log    Selecting Cheque Abuser List
    Select From List By Value    //select[@id="chequeAbuserList"]    ${value}
    Capture Screenshot
Click on Save Basic
    Wait Until Element Is Visible    //button[@id="saveBasic"]    timeout=10s
    Log    Clicking on Save Button
    Sleep    2s
    Click Button    //button[@id="saveBasic"]
    Capture Screenshot
    #Select Frame    main
    Execute JavaScript    window.top.focus();
    #Execute JavaScript    window.scrollTo(0, 0)
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
Select Date From Date Picker
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="dob"]    timeout=5s
    Click Date Picker    //input[@id="dob"]    ${value}
    Capture Screenshot
Click Date Picker
    [Arguments]    ${date_input}    ${date}
    Click Element    ${date_input}  # Click the input field to open the date picker
    Wait Until Element Is Visible    //table[@class='ui-datepicker-calendar']  # Wait until the date picker is visible
    ${day}    Get Date Day    ${date}
    ${month}    Get Date Month    ${date}
    ${year}    Get Date Year    ${date}
    Select Date Year    ${year}
    Select Date Month    ${month}
    Select Date Day    ${day}

Select Date Year
    [Arguments]    ${year}
    # Modify this to fit your date picker
    Click Element    //select[@class='ui-datepicker-year']/option[text()='${year}']  # Example for year dropdown

Select Date Month
    [Arguments]    ${month}
    # Modify this to fit your date picker
    ${month}    Evaluate    int('${month}') - 1
    Click Element    //select[@class='ui-datepicker-month']/option[@value='${month}']  # Example for month dropdown

Select Date Day
    [Arguments]    ${day}
    # Modify this to fit your date picker
    Click Element    //td[@data-handler="selectDay"]/a[text()='${day}']  # Click the day of the month in the calendar

Get Date Day
    [Arguments]    ${date}
    ${day}    Evaluate    '${date}'.split('-')[0]    # Splitting 'DD-MM-YYYY'
    [Return]    ${day}

Get Date Month
    [Arguments]    ${date}
    ${month}    Evaluate    '${date}'.split('-')[1]    # Splitting 'DD-MM-YYYY'
    [Return]    ${month}

Get Date Year
    [Arguments]    ${date}
    ${year}    Evaluate    '${date}'.split('-')[2]    # Splitting 'DD-MM-YYYY'
    [Return]    ${year}
Click Address Details
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //li[a[contains(text(),"Address Details")]]    timeout=10s
    Log    Clicking on Address Details
    Click Element    //li[a[contains(text(),"Address Details")]]
    Capture Screenshot
Select Address Type
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 350);
    Select Frame    //iframe[@id="viewAddressDetailsFrame"]
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="addressType"]     timeout=10s
    Select From List By Value    //select[@id="addressType"]    ${value}

Select Property ownership
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="proptyOwshp"]     timeout=10s
    Select From List By Value    //select[@id="proptyOwshp"]    ${value}
Enter Address Line1
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="addressLine1"]    timeout=5s
    Log    Enter Address Line1
    Input Text    //input[@id="addressLine1"]    ${value}
    Capture Screenshot

Enter flat
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="flatOrVilla"]    timeout=5s
    Log    Enter flat
    Input Text    //input[@id="flatOrVilla"]    ${value}
    Capture Screenshot

Enter Building
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="building"]    timeout=5s
    Log    Enter flat
    Input Text    //input[@id="building"]    ${value}
    Capture Screenshot

Enter Avenue
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="avenue"]    timeout=5s
    Log    Enter avenue
    Input Text    //input[@id="avenue"]    ${value}
    Capture Screenshot

Select Block
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="pinCode"]     timeout=10s
    Select From List By Value    //select[@id="pinCode"]    ${value}
Select Country
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="country"]     timeout=10s
    Select From List By Value    //select[@id="country"]    ${value}
Select City_Area
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="state"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="state"]    ${value}
Click Is PermantAdd
    Wait Until Element Is Visible    //input[@id="isPermantAdd"]    timeout=10s
    Log    Clicking Is PermantAdd Checkbox
    Click Element    //input[@id="isPermantAdd"]
    Capture Screenshot
Click on Save Address
    Wait Until Element Is Visible    //button[@id="saveAddr"]   timeout=10s
    Log    Clicking on Save Address Button
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2s
    Click Button    //button[@id="saveAddr"]
    Sleep    5s
    Capture Screenshot
Click Identification Details
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //li[a[contains(text(),"Identification Details")]]    timeout=10s
    Log    Clicking on Identification Details
    Click Element    //li[a[contains(text(),"Identification Details")]]
    Capture Screenshot
Enter Issue Date
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="issueDate"]    timeout=5s
    Log    Enter Issue Date
    Input Text    //input[@id="issueDate"]    ${value}
    Capture Screenshot
Enter Expiry Date
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="expiryDate"]    timeout=5s
    Log    Expiry Date
    Input Text    //input[@id="expiryDate"]    ${value}
    Capture Screenshot
Select Renewal Under Process
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="renewalUnderProcess"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="renewalUnderProcess"]    ${value}
Click on Save Identy
    Wait Until Element Is Visible    //button[@id="saveIdenty"]   timeout=10s
    Log    Clicking on Save Address Button
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2s
    Click Button    //button[@id="saveIdenty"]
    Sleep    5s
    Capture Screenshot
Click Employment Details
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //li[a[contains(text(),"Employment Details")]]    timeout=10s
    Log    Clicking on Employment Details
    Click Element    //li[a[contains(text(),"Employment Details")]]
    Capture Screenshot

Select Nature of Emplmt
    [Arguments]    ${value}
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewemploymentIdFrame"]
    Wait Until Element Is Visible    //select[@id="natureOfEmplmt"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="natureOfEmplmt"]    ${value}
Select Income Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="incomeType"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="incomeType"]    ${value}
Enter Income Amt
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="incomeAmt_txt"]    timeout=5s
    Log    Income Amt
    Input Text    //input[@id="incomeAmt_txt"]    ${value}
    Capture Screenshot
Click on Add Income
    Wait Until Element Is Visible    //button[@id="addIncomebt"]    timeout=10s
    Log    Clicking on Ad Button
    Sleep    2s
    Click Button    //button[@id="addIncomebt"]
    Sleep    2s
    Capture Screenshot
Click Bank Details
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //li[a[contains(text(),"Bank Details")]]    timeout=10s
    Log    Clicking on Identification Details
    Click Element    //li[a[contains(text(),"Bank Details")]]
    Capture Screenshot
Select Bank Name
    [Arguments]    ${value}
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewBankDetailsFrame"]
    Wait Until Element Is Visible    //select[@id="bankName"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="bankName"]    ${value}
Enter Account Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="accountNumber"]    timeout=5s
    Log    Account Number
    Input Text    //input[@id="accountNumber"]    ${value}
    Capture Screenshot
Enter IBAN Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="ibanNumber"]    timeout=5s
    Log    IBAN Number
    Input Text    //input[@id="ibanNumber"]    ${value}
    Capture Screenshot
Click on Save Bank
    Wait Until Element Is Visible    //button[@id="saveBank"]     timeout=10s
    Log    Clicking on Save Bank
    Sleep    2s
    Click Button    //button[@id="saveBank"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
