*** Settings ***
Library    SeleniumLibrary
Library    D:/New_automation_/web-automation-framework/libraries/read_excel_data.py
#Resource    D:/New_automation_/web-automation-framework/resources/keywords/utility_keywords.robot
Resource    D:/New_automation_/web-automation-framework/resources/keywords/Lead_Creation.robot
Library    OperatingSystem
Library    DateTime
Library    Collections

*** Variables ***
${EXCEL_FILE_PATH}    D:/New_automation_/web-automation-framework/resources/test_data/Lead_Creation.xlsx
#${SCREENSHOT_DIR}     screenshots/screenshot
#${DATE_FORMAT}        %Y-%m-%d_%H-%M-%S

*** Test Cases ***

Lead_Creation_CPR
    [Tags]    smoke    regression    lead_creation
    [Setup]    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}   Lead_Creation_CPR
    FOR    ${user}    IN    @{login_data}
        Lead_Creation_flow    ${user}
    END
    [Teardown]    Close Browser
Lead_Creation_CR_flow_Teller
    [Tags]    smoke    regression    lead_creation
    [Setup]    Open Browser    http://172.21.0.123:5555/finairoLending-1.0.1/LoginPage?tid=139&lang=en    chrome
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Lead_Creation_CR_flow_Teller
    FOR    ${user}    IN    @{login_data}
#        ICA Verification_Teller    ${user}
        Lead_Creation_CR_flow_Teller    ${user}
    END
    [Teardown]    Close Browser
Lead_Creation_CPR_Teller
    [Tags]    smoke    regression    lead_creation
    [Setup]    Open Browser    http://172.21.0.123:5555/finairoLending-1.0.1/LoginPage?tid=139&lang=en    chrome
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}   Lead_Creation_CPR_Teller
    FOR    ${user}    IN    @{login_data}
        Lead_Creation_flow_Teller    ${user}
    END
    [Teardown]    Close Browser

Lead_Creation_CR
    [Tags]    smoke    regression    lead_creation
    [Setup]    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139&lang=en    chrome
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Lead_Creation_CR
    FOR    ${user}    IN    @{login_data}
        Lead_Creation_CR_flow    ${user}
    END
    [Teardown]    Close Browser
Lead_Creation_CPR_Co_Applicant_Solar
    [Tags]    smoke    regression    lead_creation
    [Setup]    Open Browser    http://172.21.0.123:5555/finairoLending-1.0.1/LoginPage?tid=139&lang=en    chrome
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Lead_Creation_CPR_Co_Applicant_Solar
    FOR    ${user}    IN    @{login_data}
        Lead_Creation_flow_CPR_Co_Applicant    ${user}
    END
    [Teardown]    Close Browser

Lead_Creation_CR_Co_Applicant_Solar
    [Tags]    smoke    regression    lead_creation
    [Setup]    Open Browser    http://172.21.0.123:5555/finairoLending-1.0.1/LoginPage?tid=139&lang=en    chrome
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Lead_Creation_CR_Co_Applicant_Solar
    FOR    ${user}    IN    @{login_data}
        Lead_Creation_CR_flow_Co_Applicant    ${user}
    END
    [Teardown]    Close Browser

Lead_Creation_CR_Co_Applicant_Medical
    [Tags]    smoke    regression    lead_creation
    [Setup]    Open Browser    http://172.21.0.123:5555/finairoLending-1.0.1/LoginPage?tid=139&lang=en    chrome
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Lead_Creation_CR_Co_Applicant_Medical
    FOR    ${user}    IN    @{login_data}
        Lead_Creation_CR_flow_Co_Applicant_Medical    ${user}
    END
    [Teardown]    Close Browser
