*** Settings ***
Library  SeleniumLibrary
Resource  .${/}Common_variables.robot


*** Variables ***
${page_title}=  My Store
${btn_SignIn}=  css=.login


*** Keywords ***
Open Home Page
    Open Browser  ${HOME PAGE URL}  ${BROWSER}
    Maximize Browser Window

Sign In
    Wait Until Element Is Visible  ${btn_SignIn}  ${WAIT_TIME}
    Click Element  ${btn_SignIn}
