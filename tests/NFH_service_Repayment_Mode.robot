*** Settings ***
Library    SeleniumLibrary
Library    D:/New_automation_/web-automation-framework/libraries/read_excel_data.py
Resource    D:/New_automation_/web-automation-framework/resources/keywords/utility_keywords.robot
Resource    D:/New_automation_/web-automation-framework/resources/keywords/Nfh_Service Request_Repayment_Mode.robot
#Library    D:/New_automation_/web-automation-framework/libraries/custom_selenium_keywords.py
Library    OperatingSystem
Library    DateTime
Library    Collections





Suite Setup    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
#Suite Teardown    Close Browser

*** Variables ***
${EXCEL_FILE_PATH}    D:/New_automation_/web-automation-framework/resources/test_data/NFH_service_Repayment_Mode.xlsx
${SHEET_NAME}         LoginData
${SCREENSHOT_DIR}     screenshots/screenshot
${DATE_FORMAT}        %Y-%m-%d_%H-%M-%S

*** Test Cases ***
Service_Repayment_Mode_EFT
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Service_Repayment_Mode_EFT
    FOR    ${user}    IN    @{login_data}
        Repayment_Mode_EFT    ${user}
        #Open URL And Verify Repayment Mode    ${user}
    END
    #Close Browse

Service_Repayment_Mode_Cash
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Service_Repayment_Mode_Cash
    FOR    ${user}    IN    @{login_data}
        Repayment_Mode_Cash    ${user}
        #Open URL And Verify Repayment Mode    ${user}
    END
    #Close Browse