*** Settings ***
Library    SeleniumLibrary
Library    D:/New_automation_/web-automation-framework/libraries/read_excel_data.py
Resource    D:/New_automation_/web-automation-framework/resources/keywords/utility_keywords.robot
#Library    D:/New_automation_/web-automation-framework/libraries/custom_selenium_keywords.py
Library    OperatingSystem
Library    DateTime
Library    Collections





Suite Setup    Open Browser    https://kafalah-sit.kiya.ai/finairoLending-1.0.1/LogoutPage    chrome
#Suite Teardown    Close Browser

*** Variables ***
${EXCEL_FILE_PATH}    D:/New_automation_/web-automation-framework/resources/test_data/test_data.xlsx
${SHEET_NAME}         LoginData
${SCREENSHOT_DIR}     screenshots/screenshot
${DATE_FORMAT}        %Y-%m-%d_%H-%M-%S

*** Test Cases ***
Valid Login Test 1
    [Documentation]    Test login using data from Excel
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Valid Login Test 1
    FOR    ${user}    IN    @{login_data}
        Perform Login Steps    ${user}
        Perform Logout Steps
    END
    #Close Browser

Valid Site Visit Test 2
    #Open Browser    https://kafalah-sit.kiya.ai/finairoLending-1.0.1/LogoutPage    chrome
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Valid Site Visit Test 2
    FOR    ${user}    IN    @{login_data}
        Perform Site Visit Steps    ${user}
        Log_Out
    END
    #Close Browser

Valid PTP Test 3
    #Open Browser    https://kafalah-sit.kiya.ai/finairoLending-1.0.1/LogoutPage    chrome
    Maximize Browser Window
    ${login_data}=    Get Test Data    ${EXCEL_FILE_PATH}    Valid PTP Test 3
    FOR    ${user}    IN    @{login_data}
        Perform Site Visit Steps    ${user}
        PTP_Flow    ${user}
        Log_Out
    END
    #Close Browser

