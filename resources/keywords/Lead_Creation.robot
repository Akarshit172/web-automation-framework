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
    Enter Dob    ${user['DateOfBirth']}
    Select educationLevel    ${user['EducationLevel']}
    Select Marital Status    ${user['MaritalStatus']}
    Enter No Of Dependents    ${user['NoOfDependents']}
    Select Returned Cheques    ${user['ReturnedCheques']}
    Select Cheque Abuser List    ${user['ChequeAbuserList']}
    Click on Save Basic

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
    Execute Javascript    window.scrollBy(0, 300);
    Select Frame    //iframe[@id="viewBasicDetailsFrame"]
    Wait Until Element Is Visible    //a[@class="btn sm btn-info px-1 py-0 editBtn"]     timeout=10s
    Sleep    3s
    Click Element    //a[@class='btn sm btn-info px-1 py-0 editBtn']
    #Execute JavaScript    document.evaluate("//a[@class='btn sm btn-info px-1 py-0 editBtn']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
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

