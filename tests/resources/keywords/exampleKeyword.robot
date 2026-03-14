*** Settings ***

Library    SeleniumLibrary
Library    ${EXECDIR}/tests/libraries/exampleCustomKeyword.py

Resource    ${EXECDIR}/tests/variables/exampleVariables.robot

*** Keywords ***

Se connecter à l'URL sur Chrome
    Open Browser    url=${URL}    browser=chrome
    Maximize Browser Window

Se connecter à l'URL sur Chrome en mode headless
    ${HEADLESS}=    Set Variable    --headless
    ${NO_SANDBOX}=    Set Variable    --no-sandbox
    ${SHM_USAGE}=    Set Variable    --disable-dev-shm-usage

    ${OPTIONS}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    Call Method    ${OPTIONS}    add_argument    ${HEADLESS}
    Call Method    ${OPTIONS}    add_argument    ${NO_SANDBOX}
    Call Method    ${OPTIONS}    add_argument    ${SHM_USAGE}
    
    Open Browser    url=${URL}    browser=chrome    options=${OPTIONS}
    Maximize Browser Window

Accepter les cookies Google
    Wait Until Element Is Visible    locator=xpath=//button[@id='L2AGLb']    timeout=5s
    Click Button    locator=xpath=//button[@id='L2AGLb']

Accepter les cookies Google si existants
    ${PRESENT}=    Run Keyword And Return Status    
    ...    Wait Until Element Is Visible    locator=xpath=//button[@id='L2AGLb']    timeout=5s

    Run Keyword If    ${PRESENT}    
    ...    Click Button    locator=xpath=//button[@id='L2AGLb']

Saisir du texte inversé dans la barre de recherche
    [Arguments]    ${TEXTE}
    ${TEXTE_INVERSE}    Reverse String    string=${TEXTE}
    Input Text    locator=name:q    text=${TEXTE_INVERSE}

Fermer Chrome
    Close Browser