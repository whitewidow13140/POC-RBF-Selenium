*** Settings ***

Library    SeleniumLibrary
Library    ${EXECDIR}/tests/libraries/exampleCustomKeyword.py

Resource    ${EXECDIR}/tests/variables/exampleVariables.robot

*** Keywords ***

Se connecter à l'URL sur Chrome
    Open Browser    url=${URL}    browser=chrome
    Maximize Browser Window

Accepter les cookies Google
    Wait Until Element Is Visible    locator=xpath=//button[@id='L2AGLb']    timeout=5s
    Click Button    locator=xpath=//button[@id='L2AGLb']

Saisir du texte inversé dans la barre de recherche
    [Arguments]    ${TEXTE}
    ${TEXTE_INVERSE}    Reverse String    string=${TEXTE}
    Input Text    locator=name:q    text=${TEXTE_INVERSE}

Fermer Chrome
    Close Browser