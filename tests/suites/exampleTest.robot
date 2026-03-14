*** Settings ***

Resource    ${EXECDIR}/tests/resources/keywords/exampleKeyword.robot

*** Test Cases ***

Effectuer une recherche
    Se connecter à l'URL sur Chrome
    Accepter les cookies Google
    Saisir du texte inversé dans la barre de recherche    TEXTE=ABCDEF
    Capture Page Screenshot    filename=Page_Google.png
    Fermer Chrome