*** Settings ***
Library    SeleniumLibrary
Library    D:/New_automation_/web-automation-framework/libraries/read_excel_data.py
Resource    D:/New_automation_/web-automation-framework/resources/keywords/utility_keywords.robot
Resource    D:/New_automation_/web-automation-framework/resources/keywords/Nfh_Service Request_Change_Address.robot
#Library    D:/New_automation_/web-automation-framework/libraries/custom_selenium_keywords.py
Library    OperatingSystem
Library    DateTime
Library    Collections





Suite Setup    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
#Suite Teardown    Close Browser

*** Variables ***
${EXCEL_FILE_PATH}    D:/New_automation_/web-automation-framework/resources/test_data/NFH_service_Change_Address.xlsx
${SHEET_NAME}         LoginData
${SCREENSHOT_DIR}     screenshots/screenshot
${DATE_FORMAT}        %Y-%m-%d_%H-%M-%S

*** Test Cases ***
Service Request Change Permanent Address
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Service Request Change Permanent Address

    FOR    ${user}    IN    @{login_data}
        Change Address    ${user}
    END
    Close Browser
Service Request Change Mailing Address
    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Service Request Change Mailing Address
    FOR    ${user}    IN    @{login_data}
        Change Address    ${user}
        #Open URL And Verify Change Address   ${user}
    END
    Close Browser

Service Request Change Present Address
    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Service Request Change Present Address
    FOR    ${user}    IN    @{login_data}
        Change Address    ${user}
        #Open URL And Verify Change Address   ${user}
    END
    Close Browser
Service Request Office Address
    Open Browser    http://172.21.0.42:7223/finairoLending-1.0.1/LoginPage?tid=139    chrome
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Service Request Office Address
    FOR    ${user}    IN    @{login_data}
        Change Address    ${user}
        #Open URL And Verify Change Address   ${user}
    END
    Close Browser