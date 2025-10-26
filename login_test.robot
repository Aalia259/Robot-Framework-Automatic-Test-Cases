*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         http://localhost:8080
${BROWSER}     Chrome
${USERNAME}    admin
${PASSWORD}    y7py3FffUm

*** Test Cases ***
Valid Login to Mayan EDMS
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--start-maximized")

    # Enter username
    Wait Until Element Is Visible    id=id_username    timeout=15s
    Click Element                    id=id_username
    Clear Element Text               id=id_username
    Input Text                       id=id_username    ${USERNAME}

    # Enter password using simulated keystrokes
    Wait Until Element Is Visible    id=id_password    timeout=15s
    Click Element                    id=id_password
    Clear Element Text               id=id_password
    Press Keys                       id=id_password    ${PASSWORD}

    # Click Sign in
    Wait Until Element Is Visible    css=.btn-hotkey-default    timeout=30s
    Click Element                    css=.btn-hotkey-default
    Sleep    3s

    # Wait for home page to load
    Location Should Contain          ${URL}/#/home

    Capture Page Screenshot
    Close Browser