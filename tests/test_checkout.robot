*** Settings ***
Library    ../libraries/read_excel_data.py

*** Variables ***
${EXCEL_FILE_PATH}    ../resources/test_data/test_data.xlsx
${SHEET_NAME}         LoginData

*** Keywords ***
Get Login Data From Excel
    ${data}=    Read Excel    ${EXCEL_FILE_PATH}    ${SHEET_NAME}
    [Return]    ${data}

*** Test Cases ***
Valid Login Test
    [Documentation]    Read login data from Excel and test login functionality.
    ${login_data}=    Get Login Data From Excel
    :FOR    ${user}    IN    @{login_data}
    \    Input Username    ${user['username']}
    \    Input Password    ${user['password']}
    \    Click Login Button
    \    Wait For PopUp
    \    Click Pop_Up_Yes Button
    \    Wait For Menu To Load
    \    Click Menu Button
    \    Capture Page Screenshot
