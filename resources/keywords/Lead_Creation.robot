*** Settings ***
Library    SeleniumLibrary
#Library    ../../libraries/custom_selenium_keywords.py  # Import Python custom keywords
*** Variables ***
${SCREENSHOT_DIR}     screenshots/screenshot
${assignedTo}
${serviceId}
${ELEMENT}    xpath=//div[@id="interface-view"]/div/div/div[1]/div/a
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
    Lead_Creation_KYC    ${user}
#    Lead_Creation_Product_Details    ${user}
#    Lead_Creation_Loan Details    ${user}
#    Lead_Creation_Repayment_Mode    ${user}
#    Lead_Creation_Customer_Document    ${user}
#    Lead_Creation_Policy_Review    ${user}

    #Select ID Type    ${user['IDType']}
    #Enter ID Number    ${user['IDNumber']}
Lead_Creation_CR_flow
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
    Enter CompanyName    ${user['companyName']}
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
    Lead_Creation_CR_KYC    ${user}
Lead_Creation_KYC
    [Arguments]    ${user}
#    Wait For Page To Load
#    Capture Screenshot
#    Input Username    ${user['username']}
#    Click Login Button
#    Click Pop_Up_Yes Button
#    Click Inbox
#    Click on Lead    ${user['IDNumber']}
#    Click on Detail Data Entry
    Click on KYC
    Basic Details    ${user}
    Address Details    ${user}
    Identification Details    ${user}
    Employment Details    ${user}
    Bank Details    ${user}
    Contact Details    ${user}
    Lead_Creation_Product_Details    ${user}
    Lead_Creation_Loan Details    ${user}
    Lead_Creation_Repayment_Mode    ${user}
    Lead_Creation_Customer_Document    ${user}
    Lead_Creation_Policy_Review    ${user}
    ICA Verification    ${user}
Lead_Creation_CR_KYC
    [Arguments]    ${user}
#    Wait For Page To Load
#    Capture Screenshot
#    Input Username    ${user['username']}
#    Click Login Button
#    Click Pop_Up_Yes Button
#    Click Inbox
#    Click on Lead    ${user['IDNumber']}
#    Click on Detail Data Entry
    Click on KYC
    Basic Details CR    ${user}
    Address Details CR    ${user}
    Identification DetailsC    ${user}
    #Employment Details    ${user}
    Bank Details    ${user}
    Business Details    ${user}
    Contact Details    ${user}
    Lead_Creation_Product_Details    ${user}
    Lead_Creation_Loan Details    ${user}
    Lead_Creation_Repayment_Mode    ${user}
    Lead_Creation_Customer_Document    ${user}
    Lead_Creation_Policy_Review    ${user}

Lead_Creation_Product_Details
    [Arguments]    ${user}
#    Wait For Page To Load
#    Capture Screenshot
#    Input Username    ${user['username']}
#    Click Login Button
#    Click Pop_Up_Yes Button
#    Click Inbox
#    Click on Lead    ${user['IDNumber']}
#    Click on Detail Data Entry
    Click on Product Details
    Select Record Available With NFH	${user['regWithNfh']}
    Select Purchase Type	${user['vehPurchaseType']}
    Select Hire Purchase	${user['hirePurchase']}
    Select Vehicle Owner	${user['isApplicantOwner']}
    Select Security Type	${user['isPrimrySecurity']}
    Select Vehicle Dealer	${user['vehDealer']}
    Select Dealer Salesman	${user['dealerSaleman']}
    Select Vehicle Category	${user['vehCat']}
    Select Vehicle maker	${user['vehMaker']}
    Select Vehicle Model	${user['vehModel']}
    Select Vehicle Model Category	${user['vehModelCat']}
    Select Country of Manufacture	${user['manufactureCountry']}
    Enter Vat on Chasis Number    ${user['chasisNumber']}
    Enter Vat on Engine Number    ${user['engineNumber']}
    Select Colour	${user['colour']}
    Select Year Of Manufacture    ${user['manufactureYear']}
    Enter Vehicle Price    ${user['vehiclePrice_txt']}
    #Enter Down Payment    ${user['downPaymentPer_txt']}
    #Enter Initial Payment To NFH    ${user['initialPaymt_txt']}
    Enter Actual Vehicle Price    ${user['actVehiclePrice_txt']}
    Enter Admin Fees    ${user['adminCharge_txt']}
    #Enter Vat on Admin Fees    ${user['adminVat']}
    #Enter Admin Fees Including VAT    ${user['adminChagreWithVat_txt']}
    Select Admin Fees Payment Mode    ${user['modeOfPayment']}
    Select Is Insurance With NFH    ${user['isInsuredWithNFH']}
    Click on Save Collateral

Lead_Creation_Valuation Details
    [Arguments]    ${user}
#    Wait For Page To Load
#    Capture Screenshot
#    Input Username    ${user['username']}
#    Click Login Button
#    Click Pop_Up_Yes Button
#    Click Inbox
#    Click on Lead    ${user['IDNumber']}
#    Click on Detail Data Entry
    Click on Valuation Details
    Select Collateral Type	${user['collateralType']}
    Select Collateral SubType	${user['collateralSubType']}
    Select Valuator Name	${user['valuatorName']}
    Enter Other Valuator Name	${user['otherValuatorName']}
    Enter Estimated ValuationAmt	${user['estimatedValuationAmt_txt']}
    Enter Final ValuationAmt	${user['finalValuationAmt_txt']}
    Enter Valuation Date	${user['valuationDate']}
    Select Vehicle Category    ${user['vehCat']}
    Select Vehicle Maker    ${user['vehMaker']}
    Select Vehicle Model    ${user['vehModel']}
    Select Vehicle Model Category    ${user['vehModelCat']}
    Enter year    ${user['manufactureYear']}
    Enter Chassis No    ${user['chassisNo']}
    Enter Registration No    ${user['registrationNo']}
    Enter Engine Capacity    ${user['engineCapacity']}
    Enter Mileage    ${user['mileage']}
    Enter Cylinder    ${user['cylinder']}
    Enter Color    ${user['color']}
    Enter Insurance Type    ${user['insuranceType']}
    Select Vehicle Condition    ${user['vehicleCondition']}
    Select Exterior Condition    ${user['exteriorCondition']}
    Select Interior Condition    ${user['interiorCondition']}
    Select Tyre Condition    ${user['tyreCondition']}
    Select Engine Condition    ${user['engineCondition']}
    Select Gear Box    ${user['gearBox']}
    Select Suspension    ${user['suspension']}
    Select InteriorType    ${user['interiorType']}
    Select Manufacture Warranty    ${user['manufactureWarranty']}
    Enter Warrnty Year Remaining    ${user['warrntyYearRemaining']}
    Select Alloy Wheels    ${user['alloyWheels']}
    Select Spare Tyre    ${user['spareTyre']}
    Select Jack    ${user['jack']}
    Select Tool    ${user['tool']}
    Select Wheel Caps    ${user['wheelCaps']}
    Select Floorr Mats    ${user['floorrMats']}
    Select Fire Extinguisher    ${user['fireExtinguisher']}
    Select First AidKit    ${user['firstAidKit']}
    Select SpareKey    ${user['spareKey']}
    Select Radio    ${user['radio']}
    Select Sun Roof    ${user['sunRoof']}
    Select Electric Window    ${user['electricWindow']}
    Select Satellite Navigation    ${user['satelliteNavigation']}
    Select dvd    ${user['dvd']}
    Select Screen    ${user['screen']}
    Select Air Conditioner    ${user['airConditioner']}
    Select Battery    ${user['battery']}
    Enter Remarks    ${user['remarks']}
Lead_Creation_Loan Details
    [Arguments]    ${user}
#    Wait For Page To Load
#    Capture Screenshot
#    Input Username    ${user['username']}
#    Click Login Button
#    Click Pop_Up_Yes Button
#    Click Inbox
#    Click on Lead    ${user['IDNumber']}
#    Click on Detail Data Entry
    Click on Product Details
    Click on Loan Details
    Enter First Emi Date    ${user['firstEmiDate']}
    Enter Required Tenure    ${user['requiredTenure']}
    Click on Save Product

Lead_Creation_Repayment_Mode
    [Arguments]    ${user}
#    Wait For Page To Load
#    Capture Screenshot
#    Input Username    ${user['username']}
#    Click Login Button
#    Click Pop_Up_Yes Button
#    Click Inbox
#    Click on Lead    ${user['IDNumber']}
#    Click on Detail Data Entry
    Click on Product Details
    Click on Repayment Mode
    Enter Repayment Mode    ${user['repaymentMode']}
    Select isDefault    ${user['isDefault']}
    Click on Save RepaymentDtls
Lead_Creation_Customer_Document
    [Arguments]    ${user}
#    Wait For Page To Load
#    Capture Screenshot
#    Input Username    ${user['username']}
#    Click Login Button
#    Click Pop_Up_Yes Button
#    Click Inbox
#    Click on Lead    ${user['IDNumber']}
#    Click on Detail Data Entry
    Click on Customer Document
    Click on New document
    Select Document Group    ${user['docGrp']}
    Select Document Type    ${user['docType']}
    Choose document
    Click on Save Document
Lead_Creation_Policy_Review
    [Arguments]    ${user}
#    Wait For Page To Load
#    Capture Screenshot
#    Input Username    ${user['username']}
#    Click Login Button
#    Click Pop_Up_Yes Button
#    Click Inbox
#    Click on Lead    ${user['IDNumber']}
#    Click on Detail Data Entry
    Click on Policy Review
    Click on Policy Check
    Click Credit Score Card
    Click on Internal Credit Score
    Click Customer Risk Rating
    Click on Customer Risk Rating
ICA Verification
    [Arguments]    ${user}
#    Wait For Page To Load
#    Capture Screenshot
#    Input Username    ${user['username1']}
#    Click Login Button
#    Click Pop_Up_Yes Button
#    Click Inbox
#    Click on Lead    ${user['IDNumber']}
#    Click on Detail Data Entry
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Perform Logout Steps
    Click Re_Login Button
    Input Username    ${user['username1']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on ICA Verification
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Credit Approval Link
    Click on Credit Approval
    Enter Approval Conditions    ${user['remark']}
    Click on saveFinan
    click on Approve button
    Enter remark2    ${user['remark']}
    click on remarkSubmit Credit Approval
    Perform Logout Steps
    Click Re_Login Button
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Credit Approval Link
    Click on Credit Approval
    Enter Approval Conditions    ${user['remark']}
    Click on saveFinan
    click on Approve button
    Enter remark2    ${user['remark']}
    click on remarkSubmit Credit Approval
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Offer Link
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Deal Printing Link
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Perform Logout Steps
    Click Re_Login Button
    Input Username    ${user['username1']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Credit Check Link
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Perform Logout Steps
    Click Re_Login Button
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Document Collection Link
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Perform Logout Steps
    Click Re_Login Button
    Input Username    ${user['username1']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on LPO Link
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Perform Logout Steps
    Click Re_Login Button
    Input Username    ${user['username']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Final Check Retail Link
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Perform Logout Steps
    Click Re_Login Button
    Input Username    ${user['username1']}
    Click Login Button
    Click Pop_Up_Yes Button
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Final Check CAD Link
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Click on Disbursement Link
    Click on Disbursement
    Click on View Icon
    Click on interfaceBtn
    Click on interface Status Close
    Click on Disburse
    click on next button
    Enter remark    ${user['remark']}
    click on remarkSubmit
    Click App Pool
    Click on Pull    ${user['IDNumber']}
    Click Pop_Up_Yes Button
    Click Inbox
    Click on Lead    ${user['IDNumber']}
    Sleep    10s
Basic Details
    [Arguments]    ${user}
    Click on Edit Icon
    Select Applicant Type    ${user['ApplicantType']}
    Enter Email Id    ${user['email']}
    Select Source Of Income    ${user['SourceOfIncome']}
    Execute Javascript    window.scrollBy(0, 300);
    Select Title    ${user['Title']}
    Select Nationality    ${user['Nationality']}
    Select Country Of Jurisdiction    ${user['countryOfJurisdiction']}
    Select educationLevel    ${user['EducationLevel']}
    Select Date From Date Picker    ${user['DateOfBirth']}
    Sleep    5s
    Select educationLevel    ${user['EducationLevel']}
    Select Marital Status    ${user['MaritalStatus']}
    Enter No Of Dependents    ${user['NoOfDependents']}
    Select Returned Cheques    ${user['ReturnedCheques']}
    Select Cheque Abuser List    ${user['ChequeAbuserList']}
    Click on Save Basic
Basic Details_Co_Applicant
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
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewBasicDetailsFrame"]
    Wait Until Element Is Visible    //a[@class="btn sm btn-info px-1 py-0 editBtn"][last()]     timeout=10s
    Sleep    3s
    Select Customer Category    ${user['CustomerType']}
    Select ID Type    ${user['IDType']}
    Enter ID Number    ${user['IDNumber']}
   # Select Customer Type    ${user['CustomerTypeContactDetails']}
    Select Applicant Type    ${user['ApplicantType']}
    Enter Email Id    ${user['email']}
    Select Source Of Income    ${user['SourceOfIncome']}
    Execute Javascript    window.scrollBy(0, 300);
    Select Title    ${user['Title']}
    Select Nationality    ${user['Nationality']}
    Select Country Of Jurisdiction    ${user['countryOfJurisdiction']}
    Select educationLevel    ${user['EducationLevel']}
    Select Date From Date Picker    ${user['DateOfBirth']}
    Sleep    5s
    Select educationLevel    ${user['EducationLevel']}
    Select Marital Status    ${user['MaritalStatus']}
    Enter No Of Dependents    ${user['NoOfDependents']}
    Select Returned Cheques    ${user['ReturnedCheques']}
    Select Cheque Abuser List    ${user['ChequeAbuserList']}
    Click on Save Basic

Basic Details CR
    [Arguments]    ${user}
    Click on Edit Icon
    Select Applicant Type    ${user['ApplicantType']}
    Enter Email Id    ${user['email']}
    Select Source Of Income    ${user['SourceOfIncome']}
    Execute Javascript    window.scrollBy(0, 300);
    Select FormOfOrganization    ${user['formOfOrganization']}
    Enter Registration Date    ${user['registrationDate']}
    Enter Expiration Date    ${user['expirationDate']}
    Select PlaceOfEstablishment    ${user['placeOfEstablishment']}
    Select Purpose Code    ${user['purposeCode']}

#    Select Nationality    ${user['Nationality']}
#    Select Country Of Jurisdiction    ${user['countryOfJurisdiction']}
#    Select educationLevel    ${user['EducationLevel']}
#    Select Date From Date Picker    ${user['DateOfBirth']}
#    Sleep    5s
#    Select educationLevel    ${user['EducationLevel']}
#    Select Marital Status    ${user['MaritalStatus']}
#    Enter No Of Dependents    ${user['NoOfDependents']}
#    Select Returned Cheques    ${user['ReturnedCheques']}
#    Select Cheque Abuser List    ${user['ChequeAbuserList']}
    Click on Save Basic
Address Details CR
    [Arguments]    ${user}
    Click Address Details
    Select Address Type    ${user['addressType']}
    #Select Property ownership    ${user['PropertyOwnership']}
    Enter Address Line1C    ${user['addressLine1']}
    Enter flatOrVillaC    ${user['flat']}
    Enter buildingC    ${user['building']}
    Enter AvenueC    ${user['avenue']}
    Select BlockC    ${user['Block']}
    Select CountryC    ${user['Country']}
    Select City_AreaC    ${user['City_Area']}
    Click Is PermantAddC
    Click on Save Address
Address Details
    [Arguments]    ${user}
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
    Click Identification Details
    Click on Edit Icon IdentifiDetails
    #Click Identification Details
    Enter Issue Date    ${user['issueDate']}
    Enter Expiry Date    ${user['expiryDate']}
    Select Renewal Under Process    ${user['renewalUnderProcess']}
    Click on Save Identy
Identification DetailsC
    [Arguments]    ${user}
    Click Identification Details
    Click on Edit Icon IdentifiDetailsC
    #Click Identification Details
    #Enter Issue Date    ${user['issueDate']}
    #Enter Expiry Date    ${user['expiryDate']}
    Select Renewal Under Process    ${user['renewalUnderProcess']}
    Select CR Status    ${user['crStatus']}
    Click on Save Identy
Employment Details
    [Arguments]    ${user}
    Click Employment Details
    Select Nature of Emplmt    ${user['natureOfEmplmt']}
    Select Income Type    ${user['incomeType']}
    Enter Income Amt    ${user['incomeType']}
    Click on Add Income
    Sleep    5s
    Click on Save Employment
Bank Details
    [Arguments]    ${user}
    Click Bank Details
    Select Bank Name	${user['bankName']}
    Enter Account Number	${user['accountNumber']}
    Enter IBAN Number	${user['ibanNumber']}
    Click on Save Bank
Business Details
    [Arguments]    ${user}
    Click Business Details
    Select Auto Black listed    ${user['autoBlacklisted']}
    Select UnList Validated    ${user['unListValidated']}
    Select Returned Cheques    ${user['ReturnedCheques']}
    Select Cheque Abuser List    ${user['ChequeAbuserList']}
    Select Bank Name Business    ${user['bankNameBusiness']}
    Enter Total Credit Turnover    ${user['totCreditTurnOver']}
    Enter No Of Months    ${user['noOfMonths']}
    Enter Credit Turnover    ${user['avgCreditTurnoverPerc']}
    Click Add Cred Trnvbt
    Click Calculate
    Click on Save Business
Contact Details
    [Arguments]    ${user}
    Click Contact Details
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewReferenceDetailsFrame"]
    Select Customer Type    ${user['CustomerTypeContactDetails']}
    Select Contact Type    ${user['ContactType']}
    Select Relation With Cust    ${user['relationWithCust']}
    Enter Contact Name    ${user['relationName']}
    Enter Contact Number    ${user['MobileNumber']}
    Select Status    ${user['Contact_status']}
    Click on Save Contact Details

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
    Click Element    //input[@id='uiPwd']

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
Click on ICA Verification
    Wait Until Element Is Visible    //a[contains(text(), 'ICA Verification')]    timeout=10s
    Log    Clicking on ICA Verification
    #Scroll Element Into View    //a[contains(text(), 'ICA Verification')]
    Sleep    2s
    #Click Element    //a[contains(text(), 'Detail Data Entry')]
    Execute JavaScript    document.evaluate("//a[contains(text(), 'ICA Verification')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    #Execute JavaScript    arguments[0].click();    //a[contains(text(), 'Detail Data Entry')]
    Sleep    2s
    Capture Screenshot
Click on Credit Approval Link
    Wait Until Element Is Visible    //a[contains(text(), 'Credit Approval')]    timeout=10s
    Log    Clicking on Credit Approval
    #Scroll Element Into View    //a[contains(text(), 'Credit Approval')]
    Sleep    2s
    #Click Element    //a[contains(text(), 'Detail Data Entry')]
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Credit Approval')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    #Execute JavaScript    arguments[0].click();    //a[contains(text(), 'Detail Data Entry')]
    Sleep    2s
    Capture Screenshot

Click on Offer Link
    Wait Until Element Is Visible    //a[contains(text(), 'Offer')]    timeout=10s
    Log    Clicking on Offer
    #Scroll Element Into View    //a[contains(text(), 'Offer')]
    Sleep    2s
    #Click Element    //a[contains(text(), 'Offer')]
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Offer')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    #Execute JavaScript    arguments[0].click();    //a[contains(text(), 'Offer')]
    Sleep    2s
    Capture Screenshot
Click on Deal Printing Link
    Wait Until Element Is Visible    //a[contains(text(), 'Deal Printing')]    timeout=10s
    Log    Clicking on Deal Printing
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Deal Printing')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on Credit Check Link
    Wait Until Element Is Visible    //a[contains(text(), 'Credit Check')]    timeout=10s
    Log    Clicking on Credit Check
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Credit Check')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on Document Collection Link
    Wait Until Element Is Visible    //a[contains(text(), 'Document Collection')]    timeout=10s
    Log    Clicking on Document Collection
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Document Collection')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on LPO Link
    Wait Until Element Is Visible    //a[contains(text(), 'LPO')]    timeout=10s
    Log    Clicking on LPO
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'LPO')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on Final Check Retail Link
    Wait Until Element Is Visible    //a[contains(text(), 'Final Check Retail')]    timeout=10s
    Log    Clicking on Final Check Retail Link
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Final Check Retail')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on Final Check CAD Link
    Wait Until Element Is Visible    //a[contains(text(), 'Final Check CAD')]    timeout=10s
    Log    Clicking on Final Check CAD
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Final Check CAD')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on Disbursement Link
    Wait Until Element Is Visible    //a[contains(text(), 'Disbursement')]    timeout=10s
    Log    Clicking on Disbursement
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Disbursement')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on KYC
    Wait Until Element Is Visible    //a[contains(text(), 'KYC')]    timeout=10s
    Log    Clicking on KYC
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'KYC')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on Credit Approval
    Wait Until Element Is Visible    //a[contains(text(), 'Credit Approval')]    timeout=10s
    Log    Clicking on Credit Approval
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Credit Approval')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on Disbursement
    Wait Until Element Is Visible    //a[contains(text(), 'Disbursement')]    timeout=10s
    Log    Clicking on Disbursement
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Disbursement')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot

#Scroll Element Into View
#    [Arguments]    ${locator}
#    #${element}=    Get WebElement    ${locator}
#    Execute Javascript    arguments[0].scrollIntoView(true);    ${locator}


Click on Edit Icon
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewBasicDetailsFrame"]
    Wait Until Element Is Visible    //a[@class="btn sm btn-info px-1 py-0 editBtn"][last()]     timeout=10s
    Sleep    3s
    Click Element    //a[@class="btn sm btn-info px-1 py-0 editBtn"][last()]
    Capture Screenshot
    Sleep    3s
Click on View Icon
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewDisbursementScheduleFrame"]
    Wait Until Element Is Visible    //a[@class="btn sm btn-info px-1 py-0 ViewBtn"][last()]     timeout=10s
    Sleep    3s
    Click Element    //a[@class="btn sm btn-info px-1 py-0 ViewBtn"][last()]
    Capture Screenshot
    Sleep    3s
Click on Edit Icon IdentifiDetails
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewIdentifiDetailsIdFrame"]
    Wait Until Element Is Visible    //a[@class="btn sm btn-info px-1 py-0 editBtn"][last()]     timeout=10s
    Sleep    5s
    Click Element    //a[@class="btn sm btn-info px-1 py-0 editBtn"][last()]
    Capture Screenshot
    Sleep    3s
Click on Edit Icon IdentifiDetailsC
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewIdentifiDetailsIdFrame"]
    Wait Until Element Is Visible    //a[starts-with(@onclick, concat('EditData(', "'CR',", ''))]     timeout=10s
    Click Element    //a[starts-with(@onclick, concat('EditData(', "'CR',", ''))]
    Capture Screenshot
    Sleep    3s
Select Applicant Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="applicantType"]    timeout=5s
    Log    Selecting Applicant Type
    Select From List By Value    //select[@id="applicantType"]    ${value}
    Capture Screenshot
Select Customer Category
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="customerType"]    timeout=5s
    Log    Selecting Applicant Type
    Select From List By Value    //select[@id="customerType"]    ${value}
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
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href
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
    RETURN    ${day}

Get Date Month
    [Arguments]    ${date}
    ${month}    Evaluate    '${date}'.split('-')[1]    # Splitting 'DD-MM-YYYY'
    RETURN    ${month}

Get Date Year
    [Arguments]    ${date}
    ${year}    Evaluate    '${date}'.split('-')[2]    # Splitting 'DD-MM-YYYY'
    RETURN    ${year}
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

Enter flatOrVillaC
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="flatOrVillaC"]    timeout=5s
    Log    Enter flat
    Input Text    //input[@id="flatOrVillaC"]    ${value}
    Capture Screenshot
Enter Building
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="building"]    timeout=5s
    Log    Enter flat
    Input Text    //input[@id="building"]    ${value}
    Capture Screenshot
Enter buildingC
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="buildingC"]    timeout=5s
    Log    Enter flat
    Input Text    //input[@id="buildingC"]    ${value}
    Sleep    5s
    Capture Screenshot
Enter Avenue
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="avenue"]    timeout=5s
    Log    Enter avenue
    Input Text    //input[@id="avenue"]    ${value}
    Capture Screenshot

Enter AvenueC
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="avenueC"]    timeout=5s
    Log    Enter avenue
    Input Text    //input[@id="avenueC"]    ${value}
    Capture Screenshot
Select Block
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="pinCode"]     timeout=10s
    Select From List By Value    //select[@id="pinCode"]    ${value}
Select BlockC
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="pinCodeC"]     timeout=10s
    Select From List By Value    //select[@id="pinCodeC"]    ${value}
Select Country
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="country"]     timeout=10s
    Select From List By Value    //select[@id="country"]    ${value}
Select CountryC
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="countryC"]     timeout=10s
    Select From List By Value    //select[@id="countryC"]    ${value}
Select City_Area
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="state"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="state"]    ${value}

Select City_AreaC
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="stateC"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="stateC"]    ${value}
Click Is PermantAdd
    Wait Until Element Is Visible    //input[@id="isPermantAdd"]    timeout=10s
    Log    Clicking Is PermantAdd Checkbox
    Click Element    //input[@id="isPermantAdd"]
    Capture Screenshot

Click Is PermantAddC
    Wait Until Element Is Visible    //input[@id="isPermantAddC"]    timeout=10s
    Log    Clicking Is PermantAdd Checkbox
    Click Element    //input[@id="isPermantAddC"]
    Capture Screenshot
Click on Save Address
    Wait Until Element Is Visible    //button[@id="saveAddr"]   timeout=10s
    Log    Clicking on Save Address Button
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2s
    Click Button    //button[@id="saveAddr"]
    Sleep    5s
    Capture Screenshot
	Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href
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
Select CR Status
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="crStatus"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="crStatus"]    ${value}
Click on Save Identy
    Wait Until Element Is Visible    //button[@id="saveIdenty"]   timeout=10s
    Log    Clicking on Save Address Button
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2s
    Click Button    //button[@id="saveIdenty"]
    Sleep    5s
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href
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
    Log    Clicking on Bank Details
    Click Element    //li[a[contains(text(),"Bank Details")]]
    Capture Screenshot
Click Business Details
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //li[a[contains(text(),"Business Details")]]    timeout=10s
    Log    Clicking on Business Details
    Click Element    //li[a[contains(text(),"Business Details")]]
    Capture Screenshot
Select Bank Name
    [Arguments]    ${value}
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewBankDetailsFrame"]
    Wait Until Element Is Visible    //select[@id="bankName"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="bankName"]    ${value}
Select Bank Name Business
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="bankName"]     timeout=10s
    Sleep    2s
    Select From List By Label    //select[@id="bankName"]    ${value}
Select Auto Black listed
    [Arguments]    ${value}
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewBussinessDetailsFrame"]
    Wait Until Element Is Visible    //select[@id="autoBlacklisted"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="autoBlacklisted"]    ${value}
Select UnList Validated
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="unListValidated"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="unListValidated"]    ${value}

Enter Account Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="accountNumber"]    timeout=5s
    Log    Account Number
    Input Text    //input[@id="accountNumber"]    ${value}
    Capture Screenshot

Enter Total Credit Turnover
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="totCreditTurnOver"]    timeout=5s
    Log    Total Credit Turnover
    Input Text    //input[@id="totCreditTurnOver"]    ${value}
    Capture Screenshot
Enter No Of Months
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="noOfMonths"]    timeout=5s
    Log    No Of Months
    Input Text    //input[@id="noOfMonths"]    ${value}
    Capture Screenshot

Enter Credit Turnover
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="avgCreditTurnoverPerc"]    timeout=5s
    Log    Credit Turnover
    Select From List By Value    //select[@id="avgCreditTurnoverPerc"]    ${value}
    Capture Screenshot
Click Add Cred Trnvbt
	Wait Until Element Is Visible    //button[@id='addCredTrnvbt']    timeout=10s
	Log    Clicking on Add Cred Trnvbt
    Click Element    //button[@id='addCredTrnvbt']
    Capture Screenshot
Click Calculate
	Wait Until Element Is Visible    //button[@id='fundBtn']    timeout=10s
	Log    Clicking on Calculate
    Click Element    //button[@id='fundBtn']
    Capture Screenshot
Click on Save Business
    Wait Until Element Is Visible    //button[@id="saveBusin"]     timeout=10s
    Log    Clicking on Save Business
    Sleep    2s
    Click Button    //button[@id="saveBusin"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href
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
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href

Click Contact Details
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //li[a[contains(text(),"Contact Details")]]    timeout=10s
    Log    Clicking on Contact Details
    Click Element    //li[a[contains(text(),"Contact Details")]]
    Capture Screenshot
Select Contact Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="contactType"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="contactType"]    ${value}

Enter Contact Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="contactNumber"]    timeout=5s
    Log    Contact Number
    Input Text    //input[@id="contactNumber"]    ${value}
    Capture Screenshot
Enter Contact Name
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="relationName"]    timeout=5s
    Log    Contact Name
    Input Text    //input[@id="relationName"]    ${value}
    Capture Screenshot
Select Status
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="status"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="status"]    ${value}
Click on Save Contact Details
    Wait Until Element Is Visible    //button[@id="referanceSave"]     timeout=10s
    Log    Clicking on Save Bank
    Sleep    2s
    Click Button    //button[@id="referanceSave"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href

Click on Product Details
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //a[contains(text(), 'Product Details')]    timeout=10s
    Log    Clicking on Product Details
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Product Details')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot


Select Record Available With NFH
    [Arguments]    ${value}
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewCollateralBasicDtlFrame"]
    Wait Until Element Is Visible    //select[@id="regWithNfh"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="regWithNfh"]    ${value}
Select Purchase Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="vehPurchaseType"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="vehPurchaseType"]    ${value}
Select Hire Purchase
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="hirePurchase"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="hirePurchase"]    ${value}
Select Vehicle Owner
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="isApplicantOwner"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="isApplicantOwner"]    ${value}
Select Security Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="isPrimrySecurity"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="isPrimrySecurity"]    ${value}
Select Vehicle Dealer
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="vehDealer"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="vehDealer"]    ${value}
Select Dealer Salesman
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="dealerSaleman"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="dealerSaleman"]    ${value}
Select Vehicle Category
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="vehCat"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="vehCat"]     ${value}
Select Vehicle maker
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="vehMaker"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="vehMaker"]    ${value}
Select Vehicle Model
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="vehModel"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="vehModel"]    ${value}
Select Vehicle Model Category
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="vehModelCat"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="vehModelCat"]    ${value}
Select Country of Manufacture
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="manufactureCountry"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="manufactureCountry"]    ${value}
Enter Vat on Chasis Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="chasisNumber"]    timeout=5s
    Log    Vat on chasisNumber
    Input Text    //input[@name="chasisNumber"]    ${value}
    Capture Screenshot
Enter Vat on Engine Number
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="engineNumber"]    timeout=5s
    Log    Vat on engineNumber
    Input Text    //input[@name="engineNumber"]    ${value}
    Capture Screenshot
Select Colour
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="colour"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="colour"]    ${value}
Select Year Of Manufacture
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="manufactureYear"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="manufactureYear"]    ${value}
Enter Vehicle Price
    [Arguments]    ${value}

    Wait Until Element Is Visible    //input[@name="vehiclePrice_txt"]    timeout=5s
    Execute JavaScript    document.getElementById('vehiclePrice_txt').focus();
    Execute JavaScript    document.getElementById('vehiclePrice_txt').value = '';
    Input Text    //input[@name="vehiclePrice_txt"]    ${value}
    Execute JavaScript    document.getElementById('vehiclePrice_txt').dispatchEvent(new KeyboardEvent('keydown', { key: "Enter" }));
    Execute JavaScript    document.getElementById('vehiclePrice_txt').dispatchEvent(new KeyboardEvent('keyup', { key: "Enter" }));
    Execute JavaScript    document.getElementById('vehiclePrice_txt').dispatchEvent(new KeyboardEvent('keypress', { key: "Enter" }));
    Execute JavaScript    document.getElementById('vehiclePrice_txt').dispatchEvent(new Event('blur'));
    Sleep    2s

Enter Down Payment
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="downPaymentPer_txt"]    timeout=5s
    Execute JavaScript    document.getElementById('downPaymentPer_txt').focus();
    Execute JavaScript    document.getElementById('downPaymentPer_txt').value = '';
    Input Text    //input[@name="downPaymentPer_txt"]    ${value}
    Execute JavaScript    document.getElementById('downPaymentPer_txt').dispatchEvent(new KeyboardEvent('keydown', { key: "Enter" }));
    Execute JavaScript    document.getElementById('downPaymentPer_txt').dispatchEvent(new KeyboardEvent('keyup', { key: "Enter" }));
    Execute JavaScript    document.getElementById('downPaymentPer_txt').dispatchEvent(new KeyboardEvent('keypress', { key: "Enter" }));
    Execute JavaScript    document.getElementById('downPaymentPer_txt').dispatchEvent(new Event('blur'));
    Sleep    1s
    Capture Screenshot

Enter Initial Payment To NFH
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="initialPaymt_txt"]    timeout=5s
    Execute JavaScript    document.getElementById('initialPaymt_txt').focus();
    Execute JavaScript    document.getElementById('initialPaymt_txt').value = '';
    Input Text    //input[@name="initialPaymt_txt"]    ${value}
    Execute JavaScript    document.getElementById('initialPaymt_txt').dispatchEvent(new KeyboardEvent('keydown', { key: "Enter" }));
    Execute JavaScript    document.getElementById('initialPaymt_txt').dispatchEvent(new KeyboardEvent('keyup', { key: "Enter" }));
    Execute JavaScript    document.getElementById('initialPaymt_txt').dispatchEvent(new KeyboardEvent('keypress', { key: "Enter" }));
    Execute JavaScript    document.getElementById('initialPaymt_txt').dispatchEvent(new Event('blur'));
    Sleep    2s
    Capture Screenshot
Enter Actual Vehicle Price
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="actVehiclePrice_txt"]    timeout=5s
    Execute JavaScript    document.getElementById('actVehiclePrice_txt').focus();
    Execute JavaScript    document.getElementById('actVehiclePrice_txt').value = '';
    Input Text    //input[@name="actVehiclePrice_txt"]    ${value}
    Execute JavaScript    document.getElementById('actVehiclePrice_txt').dispatchEvent(new KeyboardEvent('keydown', { key: "Enter" }));
    Execute JavaScript    document.getElementById('actVehiclePrice_txt').dispatchEvent(new KeyboardEvent('keyup', { key: "Enter" }));
    Execute JavaScript    document.getElementById('actVehiclePrice_txt').dispatchEvent(new KeyboardEvent('keypress', { key: "Enter" }));
    Execute JavaScript    document.getElementById('actVehiclePrice_txt').dispatchEvent(new Event('blur'));
    Capture Screenshot
Enter Admin Fees
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="adminCharge_txt"]    timeout=5s
    Execute JavaScript    document.getElementById('adminCharge_txt').focus();
    Execute JavaScript    document.getElementById('adminCharge_txt').value = '';
    Input Text    //input[@name="adminCharge_txt"]    ${value}
    Execute JavaScript    document.getElementById('adminCharge_txt').dispatchEvent(new KeyboardEvent('keydown', { key: "Enter" }));
    Execute JavaScript    document.getElementById('adminCharge_txt').dispatchEvent(new KeyboardEvent('keyup', { key: "Enter" }));
    Execute JavaScript    document.getElementById('adminCharge_txt').dispatchEvent(new KeyboardEvent('keypress', { key: "Enter" }));
    Execute JavaScript    document.getElementById('adminCharge_txt').dispatchEvent(new Event('blur'));
    Capture Screenshot
Enter Vat on Admin Fees
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="adminVat"]    timeout=5s
    Log    Vat on Admin Fees
    Input Text    //input[@name="adminVat"]    ${value}
    Capture Screenshot
Enter Admin Fees Including VAT
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="adminChagreWithVat_txt"]    timeout=5s
    Log   Admin Fees Including VAT
    Input Text    //input[@name="adminChagreWithVat_txt"]    ${value}
    Capture Screenshot
Select Admin Fees Payment Mode
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="modeOfPayment"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="modeOfPayment"]    ${value}
Select Is Insurance With NFH
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="isInsuredWithNFH"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="isInsuredWithNFH"]    ${value}
Click on Save Collateral
    Wait Until Element Is Visible    //button[@id="saveCollateral"]     timeout=10s
    Log    Clicking on Save Bank
    Sleep    2s
    Click Button    //button[@id="saveCollateral"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href

Click on Valuation Details
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //a[contains(text(), 'Valuation Details')]    timeout=10s
    Log    Clicking on Product Details
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Valuation Details')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Select Collateral Type
    [Arguments]    ${value}
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewValuationDtlScreenFrame"]
    Wait Until Element Is Visible    //select[@id="collateralType"]     timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="collateralType"]    ${value}
Select Collateral SubType
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="collateralSubType"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="collateralSubType"]    ${value}
Select Valuator Name
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="valuatorName"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="valuatorName"]    ${value}
Enter Other Valuator Name
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="otherValuatorName"]     timeout=5s
    Log    Other Valuator Name
    Input Text    //input[@id="otherValuatorName"]    ${value}
    Capture Screenshot
Enter Estimated ValuationAmt
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="estimatedValuationAmt_txt"]    timeout=5s
    Execute JavaScript    document.getElementById('estimatedValuationAmt_txt').focus();
    Execute JavaScript    document.getElementById('estimatedValuationAmt_txt').value = '';
    Input Text    //input[@name="estimatedValuationAmt_txt"]    ${value}
    Execute JavaScript    document.getElementById('estimatedValuationAmt_txt').dispatchEvent(new KeyboardEvent('keydown', { key: "Enter" }));
    Execute JavaScript    document.getElementById('estimatedValuationAmt_txt').dispatchEvent(new KeyboardEvent('keyup', { key: "Enter" }));
    Execute JavaScript    document.getElementById('estimatedValuationAmt_txt').dispatchEvent(new KeyboardEvent('keypress', { key: "Enter" }));
    Execute JavaScript    document.getElementById('estimatedValuationAmt_txt').dispatchEvent(new Event('blur'));
    Sleep    2s
Enter Final ValuationAmt
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="finalValuationAmt_txt"]    timeout=5s
    Execute JavaScript    document.getElementById('finalValuationAmt_txt').focus();
    Execute JavaScript    document.getElementById('finalValuationAmt_txt').value = '';
    Input Text    //input[@name="finalValuationAmt_txt"]    ${value}
    Execute JavaScript    document.getElementById('finalValuationAmt_txt').dispatchEvent(new KeyboardEvent('keydown', { key: "Enter" }));
    Execute JavaScript    document.getElementById('finalValuationAmt_txt').dispatchEvent(new KeyboardEvent('keyup', { key: "Enter" }));
    Execute JavaScript    document.getElementById('finalValuationAmt_txt').dispatchEvent(new KeyboardEvent('keypress', { key: "Enter" }));
    Execute JavaScript    document.getElementById('finalValuationAmt_txt').dispatchEvent(new Event('blur'));
    Sleep    2s
Enter Valuation Date
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="valuationDate"]     timeout=5s
    Log    Valuation Date
    Input Text    //input[@id="valuationDate"]    ${value}
    Capture Screenshot


Enter year
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="year"]     timeout=5s
    Log    year
    Input Text    //input[@id="year"]    ${value}
    Capture Screenshot
Enter Chassis No
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="chassisNo"]     timeout=5s
    Log    Chassis No
    Input Text    //input[@id="chassisNo"]    ${value}
    Capture Screenshot
Enter Registration No
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="registrationNo"]     timeout=5s
    Log    Registration No
    Input Text    //input[@id="registrationNo"]    ${value}
    Capture Screenshot
Enter Engine Capacity
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="engineCapacity"]     timeout=5s
    Log    Engine Capacity
    Input Text    //input[@id="engineCapacity"]    ${value}
    Capture Screenshot
Enter Mileage
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="mileage"]     timeout=5s
    Log    Mileage
    Input Text    //input[@id="mileage"]    ${value}
    Capture Screenshot
Enter Cylinder
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="cylinder"]     timeout=5s
    Log    Cylinder
    Input Text    //input[@id="cylinder"]    ${value}
    Capture Screenshot
Enter Color
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="color"]     timeout=5s
    Log    Color
    Input Text    //input[@id="color"]    ${value}
    Capture Screenshot
Enter Insurance Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="insuranceType"]     timeout=5s
    Log    Insurance Type
    Input Text    //input[@id="insuranceType"]    ${value}
    Capture Screenshot
Select Vehicle Condition
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="vehicleCondition"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="vehicleCondition"]    ${value}
Select Exterior Condition
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="exteriorCondition"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="exteriorCondition"]    ${value}
Select Interior Condition
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="interiorCondition"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="interiorCondition"]    ${value}
Select Tyre Condition
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="tyreCondition"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="tyreCondition"]    ${value}
Select Engine Condition
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="engineCondition"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="engineCondition"]    ${value}
Select Gear Box
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="gearBox"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="gearBox"]    ${value}
Select Suspension
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="suspension"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="suspension"]    ${value}
Select InteriorType
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="interiorType"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="interiorType"]    ${value}
Select Manufacture Warranty
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="manufactureWarranty"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="manufactureWarranty"]    ${value}
Enter Warrnty Year Remaining
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="warrntyYearRemaining"]     timeout=5s
    Log    Warrnty Year Remaining
    Input Text    //input[@id="warrntyYearRemaining"]    ${value}
    Capture Screenshot
Select Alloy Wheels
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="alloyWheels"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="alloyWheels"]    ${value}
    Capture Screenshot
Select Spare Tyre
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="spareTyre"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="spareTyre"]    ${value}
    Capture Screenshot
Select Jack
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="jack"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="jack"]    ${value}
    Capture Screenshot
Select Tool
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="tool"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="tool"]    ${value}
    Capture Screenshot
Select Wheel Caps
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="wheelCaps"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="wheelCaps"]    ${value}
    Capture Screenshot
Select Floorr Mats
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="floorrMats"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="floorrMats"]    ${value}
    Capture Screenshot
Select Fire Extinguisher
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="fireExtinguisher"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="fireExtinguisher"]    ${value}
    Capture Screenshot
Select First AidKit
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="firstAidKit"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="firstAidKit"]    ${value}
    Capture Screenshot
Select SpareKey
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="spareKey"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="spareKey"]    ${value}
    Capture Screenshot
Select Radio
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="radio"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="radio"]    ${value}
    Capture Screenshot
Select Sun Roof
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="sunRoof"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="sunRoof"]    ${value}
    Capture Screenshot
Select Electric Window
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="electricWindow"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="electricWindow"]    ${value}
    Capture Screenshot
Select Satellite Navigation
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="satelliteNavigation"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="satelliteNavigation"]    ${value}
    Capture Screenshot
Select dvd
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="dvd"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="dvd"]    ${value}
    Capture Screenshot
Select Screen
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="screen"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="screen"]    ${value}
    Capture Screenshot
Select Air Conditioner
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="airConditioner"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="airConditioner"]    ${value}
    Capture Screenshot
Select Battery
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="battery"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="battery"]    ${value}
    Capture Screenshot
Enter Remarks
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="mileage"]     timeout=5s
    Log    Remarks
    Input Text    //textarea[@id="remarks"]    ${value}
    Capture Screenshot
Click on Loan Details
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //a[contains(text(), 'Loan Details')]    timeout=10s
    Log    Clicking on Product Details
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Loan Details')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot

Enter First Emi Date
    [Arguments]    ${value}
    Sleep    5s
    #Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewproductIdFrame"]
    Wait Until Element Is Visible    //input[@id="firstEmiDate"]     timeout=5s
    Log    Remarks
    Input Text    //input[@id="firstEmiDate"]    ${value}
    Capture Screenshot
Enter Required Tenure
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="requiredTenure"]     timeout=5s
    Log    Required Tenure
    #Input Text    //input[@id="requiredTenure"]    ${value}
    #Press Keys    id=requiredTenure    6
    Execute Javascript    document.getElementById('requiredTenure').value = ${value};
    #Execute Javascript    document.getElementById('requiredTenure').value = '0';
    #Press Keys    id=requiredTenure    0
    Sleep    2s
    Click Button    //input[@id="ageInYears"]
    Sleep    5s
Click on Save Product
    Wait Until Element Is Visible    //button[@id="saveproduct"]    timeout=10s
    Log    Clicking on Save Button
    Sleep    2s
    Click Button    //button[@id="saveproduct"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href
Click on Repayment Mode
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //a[contains(text(), 'Repayment Mode')]    timeout=10s
    Log    Clicking on Repayment Mode
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Repayment Mode')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Enter Repayment Mode
    [Arguments]    ${value}
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewRepaymentDetailsFrame"]
    Wait Until Element Is Visible    //select[@id="repaymentMode"]     timeout=5s
    Log    Remarks
    Select From List By Value    //select[@id="repaymentMode"]    ${value}
    Capture Screenshot
Select isDefault
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="isDefault"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="isDefault"]    ${value}
    Capture Screenshot

Click on Save RepaymentDtls
    Wait Until Element Is Visible    //button[@id="saveRepaymentDtls"]    timeout=10s
    Log    Clicking on Save RepaymentDtls
    Sleep    2s
    Click Button    //button[@id="saveRepaymentDtls"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Capture Screenshot
    Execute Javascript    window.top.location.href = window.top.location.href
Click on Customer Document
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //a[contains(text(), 'Customer Document')]    timeout=10s
    Log    Clicking on Customer Document
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Customer Document')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot

Click on New document
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 300);
    Select Frame    //iframe[@id="documentUploadLOSCollectionFrame"]
    Wait Until Element Is Visible    //button[@id="newDocument"]     timeout=5s
    Log    Clicking on new document button....
    Click Button    //button[@id="newDocument"]
    Capture Screenshot
Select Document Group
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="docGrp"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="docGrp"]    ${value}
    Capture Screenshot
Select Document Type
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="docType"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="docType"]    ${value}
    Capture Screenshot
Select Relation With Cust
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="relationWithCust"]    timeout=10s
    Sleep    2s
    Select From List By Value    //select[@id="relationWithCust"]    ${value}
    Capture Screenshot

Choose document
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Choose File    xpath=//input[@id="documentData" and @type="file"]    D:/New_automation_/web-automation-framework/tests/selenium-screenshot-1.png
Click on Save Document
    Wait Until Element Is Visible    //button[@id="saveDoc"]    timeout=10s
    Log    Clicking on Save RepaymentDtls
    Sleep    2s
    Click Button    //button[@id="saveDoc"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Capture Screenshot
    Execute Javascript    window.top.location.href = window.top.location.href
Click on Save Employment
    Wait Until Element Is Visible    //button[@id="saveEmployment"]    timeout=10s
    Log    Clicking on Click on Save Employment
    Sleep    2s
    Click Button    //button[@id="saveEmployment"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Capture Screenshot
    Execute Javascript    window.top.location.href = window.top.location.href
Click on Policy Review
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //a[contains(text(), 'Policy Review')]    timeout=10s
    Log    Clicking on Policy Review
    Sleep    2s
    Execute JavaScript    document.evaluate("//a[contains(text(), 'Policy Review')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
    Capture Screenshot
Click on Policy Check
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewBHCFrame"]
    Wait Until Element Is Visible    //button[@id="generatePolCheck"]     timeout=5s
    Log    Clicking on Policy Check
    Click Button    //button[@id="generatePolCheck"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Capture Screenshot
    Execute Javascript    window.top.location.href = window.top.location.href
Click Credit Score Card
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //li[a[contains(text(),"Credit Score Card")]]    timeout=10s
    Log    Clicking on Credit Score Card
    Click Element    //li[a[contains(text(),"Credit Score Card")]]
    Capture Screenshot
Click on Internal Credit Score
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="BreViewScreenFrame"]
    Wait Until Element Is Visible    //button[@id="generateBRE"]     timeout=5s
    Log    Clicking on Internal Credit Score
    Click Button    //button[@id="generateBRE"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Capture Screenshot
    Execute Javascript    window.top.location.href = window.top.location.href
Click Customer Risk Rating
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 300);
    Wait Until Element Is Visible    //li[a[contains(text(),"Customer Risk Rating")]]    timeout=10s
    Log    Clicking on Customer Risk Rating
    Click Element    //li[a[contains(text(),"Customer Risk Rating")]]
    Capture Screenshot
Click on Customer Risk Rating
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="viewCreditRatingFrame"]
    Wait Until Element Is Visible    //button[@id="generate"]     timeout=5s
    Log    Clicking on Customer Risk Rating
    Click Button    //button[@id="generate"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Capture Screenshot
    Execute Javascript    window.top.location.href = window.top.location.href
    Execute Javascript    window.top.location.href = window.top.location.href
Enter CompanyName
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@name="companyName"]     timeout=5s
    Log    CompanyName
    Input Text    //input[@name="companyName"]    ${value}
    Capture Screenshot
Select FormOfOrganization
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="formOfOrganization"]    timeout=5s
    Log    FormOfOrganization
    Select From List By Value    //select[@id="formOfOrganization"]    ${value}
    Capture Screenshot

Enter Registration Date
    [Arguments]    ${value}
    Sleep    5s
    Wait Until Element Is Visible    //input[@id="registrationDate"]     timeout=5s
    Log    Registration Date
    Clear Element Text    //input[@id="registrationDate"]
    Sleep    5s
    Input Text    //input[@id="registrationDate"]    ${value}
    Capture Screenshot
Enter Expiration Date
    [Arguments]    ${value}
    Sleep    5s
    Wait Until Element Is Visible    //input[@id="expirationDate"]     timeout=5s
    Log    Expiration Date
    Clear Element Text    //input[@id="expirationDate"]
    Input Text    //input[@id="expirationDate"]    ${value}
    Capture Screenshot

Select PlaceOfEstablishment
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="placeOfEstablishment"]    timeout=5s
    Log    PlaceOfEstablishment
    Select From List By Value    //select[@id="placeOfEstablishment"]    ${value}
    Capture Screenshot
Select Purpose Code
    [Arguments]    ${value}
    Wait Until Element Is Visible    //select[@id="purposeCode"]    timeout=5s
    Log    Purpose Code
    Select From List By Value    //select[@id="purposeCode"]    ${value}
    Capture Screenshot
Enter Address Line1C
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id="addressLine1C"]    timeout=5s
    Log    Enter Address Line1
    Input Text    //input[@id="addressLine1C"]    ${value}
    Capture Screenshot
click on next button
    Sleep    3s
    Wait Until Element Is Visible    //a[@data-title="Move to Next"]    timeout=10s
    Log    Clicking on Customer Risk Rating
    #Click Element    //a[@data-title="Move to Next"]
    Execute JavaScript    document.evaluate("//a[@data-title='Move to Next']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Capture Screenshot
click on Approve button
    Sleep    3s
    Wait Until Element Is Visible    //a[@data-title="Approve"]    timeout=10s
    Log    Clicking on Customer Risk Rating
    #Click Element    //a[@data-title="Move to Next"]
    Execute JavaScript    document.evaluate("//a[@data-title='Approve']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Capture Screenshot
Enter remark
    [Arguments]    ${value}
    Wait Until Element Is Visible    //textarea[@id="remark"]    timeout=5s
    Log    Enter Address Line1
    Input Text    //textarea[@id="remark"]    ${value}
    Capture Screenshot
Enter remark2
    [Arguments]    ${value}
    Wait Until Element Is Visible    //textarea[@id="remarks2"]    timeout=5s
    Log    Enter Address Line1
    Input Text    //textarea[@id="remarks2"]    ${value}
    Capture Screenshot
click on remarkSubmit
    Sleep    3s
    Wait Until Element Is Visible    //a[@id="remarkSubmit"]    timeout=10s
    Log    Clicking on remarkSubmit
    Click Element    //a[@id="remarkSubmit"]
    Capture Screenshot
click on remarkSubmit Credit Approval
    Sleep    3s
    Wait Until Element Is Visible    //a[@id="offerremarksSubmit"]    timeout=10s
    Log    Clicking on remarkSubmit Credit Approval
    Click Element    //a[@id="offerremarksSubmit"]
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
Click App Pool
    Wait Until Element Is Visible    //a[@data-original-title="App Pool"]    timeout=10s
    Log    Clicking on App Pool
    Click Element    //a[@data-original-title="App Pool"]
    Capture Screenshot

Enter Approval Conditions
    [Arguments]    ${value}
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 200);
    Select Frame    //iframe[@id="addNewD320071RecordFrame"]
    Wait Until Element Is Visible    //textarea[@id="comments"]     timeout=10s
    Sleep    2s
    Input Text    //textarea[@id="comments"]    ${value}
Click on saveFinan
    Wait Until Element Is Visible    //button[@id="saveFinan"]    timeout=10s
    Log    Clicking on Save Button
    Sleep    2s
    Click Button    //button[@id="saveFinan"]
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href
    Execute Javascript    window.top.location.href = window.top.location.href
Click on interfaceBtn
    Wait Until Element Is Visible    //button[@id="interfaceBtn"]    timeout=10s
    Log    Clicking on Save Button
    Click Button    //button[@id="interfaceBtn"]
    Capture Screenshot
Click on Disburse
    Wait Until Element Is Visible    //button[@id="disburseBtn"]    timeout=10s
    Log    Clicking on Disburse
    Click Button    //button[@id="disburseBtn"]
    Capture Screenshot
    Capture Screenshot
    Execute JavaScript    window.top.focus();
    Execute JavaScript    window.top.scrollTo(0, 0)
    Sleep    2s
    Execute Javascript    window.top.location.href = window.top.location.href
    Execute Javascript    window.top.location.href = window.top.location.href
Click on interface Status Close
    Execute Javascript    window.scrollBy(0,100);
    Sleep    2s
    Wait Until Element Is Visible    //div[@id="interface-view"]/div/div/div[1]/div/a    timeout=10s
    Log    Clicking on Interface Status Close
    Sleep    2s
    Execute Javascript  var element = document.evaluate('//div[@id="interface-view"]/div/div/div[1]/div/a', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; if(element) { element.click(); } else { throw new Error("Element not found"); }
    Capture Screenshot