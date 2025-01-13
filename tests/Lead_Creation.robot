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
        END
    END
    Close Browser