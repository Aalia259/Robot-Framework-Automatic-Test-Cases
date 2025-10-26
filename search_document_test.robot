*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://localhost:8080
${BROWSER}       Chrome
${USERNAME}      admin
${PASSWORD}      y7py3FffUm


*** Test Cases ***
Search Document in Mayan EDMS
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

    # Navigate to Search bar
    Wait Until Element Is Visible    xpath=//*[contains(text(),'Search')]    timeout=10s
    Click Element                    xpath=//*[contains(text(),'Search')]
    Sleep    2s

    Capture Page Screenshot
    Close Browser