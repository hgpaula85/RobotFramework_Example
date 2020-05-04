*** Settings ***
Documentation  My first test, just login
Library     SeleniumLibrary
Library  String



*** Variables ***
${BROWSER}  chrome
${HOME PAGE URL}  http://www.google.com
${LOCATOR}  //ul[@class='sf-menu clearfix menu-content sf-js-enabled sf-arrows']/li[2]
${LOCATOR2}  //li[@class='sfHover']//a[contains(text(),'Summer Dresses')]
${total amount}  100
${exp_total_amount}  200
${operation}  LESS


*** Test Cases ***
Open and close browser
    #Set Screenshot Directory  ../Reports

    Open Browser  ${HOME PAGE URL}  ${BROWSER}
    Set Window Size  1449  1087
    #Maximize Browser Window

    Run Keyword If  '${operation}' == 'LESS'  Should Be True  ${total amount} < ${exp_total_amount}

    Close Browser

*** comment ***
    Wait Until Element Is Visible  ${LOCATOR}  5
    Mouse Over  ${LOCATOR}

    Wait Until Element Is Visible  ${LOCATOR2}  5
    Click Element  ${LOCATOR}