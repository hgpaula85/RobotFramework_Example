*** Settings ***
Library  SeleniumLibrary
Resource  .${/}Common_variables.robot
Resource    .${/}Landing_locators.robot


*** Keywords ***
Open Home Page
    Open Browser  ${HOME PAGE URL}  ${BROWSER}
    Maximize Browser Window

Sign In
    Wait Until Element Is Visible  ${btn_sign_in}  ${WAIT_TIME}
    Click Element  ${btn_sign_in}
