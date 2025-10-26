*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}         http://localhost:8080
${BROWSER}     Chrome
${USERNAME}    admin
${PASSWORD}    y7py3FffUm
${FILE_PATH}   C:\\Users\\Susmi\\Downloads\\Susmita-Aryal-2025-10-21T09_20_38.pdf

*** Test Cases ***
Upload Document in Mayan EDMS
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--start-maximized")

    # Login
    Wait Until Element Is Visible    id=id_username    timeout=15s
    Input Text                       id=id_username    ${USERNAME}
    Wait Until Element Is Visible    id=id_password    timeout=15s
    Press Keys                       id=id_password    ${PASSWORD}
    Wait Until Element Is Visible    css=.btn-hotkey-default    timeout=10s
    Click Element                    css=.btn-hotkey-default
    Sleep    3s

     # Wait for home page to load
    Location Should Contain          ${URL}/#/home

    # Navigate to Documents
    Wait Until Element Is Visible    xpath=//*[contains(text(),'Documents')]    timeout=30s
    Click Element                    xpath=//*[contains(text(),'Documents')]
    Sleep    2s

    # Click New Document
    Wait Until Element Is Visible    xpath=//*[contains(text(),'New document')]   timeout=10s
    Click Element                    xpath=//*[contains(text(),'New document')]
    Sleep    2s

    # Click to open the dropdown
    Wait Until Element Is Visible    xpath=//*[contains(text(),'Default')]
    Click Element                    xpath=//*[contains(text(),'Default')]
    Sleep    2s


     # Navigate to Next
    Wait Until Element Is Visible    xpath=//*[contains(text(),'Next')]
    Click Element                    xpath=//*[contains(text(),'Next')]
    Sleep    2s
    
    # Step 4: Final dropzone upload
    Wait Until Element Is Visible    xpath=//div[contains(@class,'dropzone')]    timeout=30
    File Should Exist                ${FILE_PATH}
    Choose File                      xpath=//input[@type='file']    ${FILE_PATH}
    Sleep                            2

    Capture Page Screenshot
    Close Browser