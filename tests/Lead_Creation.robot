*** Settings ***
Library    SeleniumLibrary
Library    D:/New_automation_/web-automation-framework/libraries/read_excel_data.py
Resource    D:/New_automation_/web-automation-framework/resources/keywords/utility_keywords.robot
Resource    D:/New_automation_/web-automation-framework/resources/keywords/Lead_Creation.robot
#Library    D:/New_automation_/web-automation-framework/libraries/custom_selenium_keywords.py
Library    OperatingSystem
Library    DateTime
Library    Collections
Suite Setup    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
#Suite Teardown    Close Browser
*** Variables ***
${EXCEL_FILE_PATH}    D:/New_automation_/web-automation-framework/resources/test_data/Lead_Creation.xlsx
${SHEET_NAME}         LoginData
${SCREENSHOT_DIR}     screenshots/screenshot
${DATE_FORMAT}        %Y-%m-%d_%H-%M-%S
*** Test Cases ***

Lead_Creation_CPR
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    FOR    ${i}    IN RANGE    1    ${2}
        ${sheet_name}=    Set Variable    Lead_Creation_CPR_${i}   # Dynamically generate sheet name like Lead_Creation_CPR_1, Lead_Creation_CPR_2, ...
        ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    ${sheet_name}
        FOR    ${user}    IN    @{login_data}
            Run Keyword If    ${i} > 1    Run Keywords    Close Browser
            Run Keyword If    ${i} > 1    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
            Lead_Creation_flow    ${user}
            #Lead_Creation_KYC    ${user}
            #ICA Verification    ${user}
        END
    END
    Close Browser
Lead_Creation_CPR_Teller
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    FOR    ${i}    IN RANGE    1    ${2}
        ${sheet_name}=    Set Variable    Lead_Creation_CPR_Teller_${i}   # Dynamically generate sheet name like Lead_Creation_CPR_1, Lead_Creation_CPR_2, ...
        ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    ${sheet_name}
        FOR    ${user}    IN    @{login_data}
            Run Keyword If    ${i} > 1    Run Keywords    Close Browser
            Run Keyword If    ${i} > 1    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
            Lead_Creation_flow_Teller    ${user}
#            Document Collection Link    ${user}
            #Lead_Creation_Product_Details_Teller    ${user}
            #Lead_Creation_KYC_Teller    ${user}
            #ICA Verification_Teller    ${user}
#            Open URL And Verify Teller    ${user}
        END
    END
    Close Browser
Lead_Creation_CR
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    FOR    ${i}    IN RANGE    1    ${2}
        ${sheet_name}=    Set Variable    Lead_Creation_CR_${i}   # Dynamically generate sheet name like Lead_Creation_CPR_1, Lead_Creation_CPR_2, ...
        ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    ${sheet_name}
        FOR    ${user}    IN    @{login_data}
            Run Keyword If    ${i} > 1    Run Keywords    Close Browser
            Run Keyword If    ${i} > 1    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
            Lead_Creation_CR_flow    ${user}
            #Lead_Creation_CR_KYC    ${user}
            #Lead_Creation_Loan Details    ${user}
        END
    END
    Close Browser

Lead_Creation_CPR_Co_Applicant_Solar
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Lead_Creation_CPR_Co_Applicant_Solar
    FOR    ${user}    IN    @{login_data}
        Lead_Creation_flow_CPR_Co_Applicant    ${user}
#        Lead_Creation_Product_Details_CPR_Co_Applicant    ${user}
#        Basic Details_Co_Applicant    ${user}

    END
Lead_Creation_CR_Co_Applicant_Solar
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Lead_Creation_CR_Co_Applicant_Solar
    FOR    ${user}    IN    @{login_data}
        Lead_Creation_CR_flow_Co_Applicant    ${user}
    END
Lead_Creation_CR_Co_Applicant_Medical
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Lead_Creation_CR_Co_Applicant_Medical
    FOR    ${user}    IN    @{login_data}
        Lead_Creation_CR_flow_Co_Applicant_Medical    ${user}
#        Lead_Creation_Product_Details_Co_Applicant_Medical    ${user}
    END