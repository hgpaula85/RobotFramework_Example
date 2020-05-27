*** Settings ***
Library  SeleniumLibrary
Resource  .${/}Common_variables.robot


*** Variables ***
# Page title
${page_title}=  My Store

# Buttons and clickable elements
${btn_SignIn}=  css=.login
${btn_CreateAcct}=  id:SubmitCreate
${btn_Login}=  id:SubmitLogin
${btn_ForgotPasswd}=  xpath=//a[@title="Recover your forgotten password"]

# Input data fields
${txt_EmailCreateAcct}=  id:email_create
${txt_EmailLogin}=  id:email
${txt_Password}=  id:passwd


*** Keywords ***
Sign In
    Wait Until Element Is Visible  ${txt_EmailLogin}
    Input Text  ${txt_EmailLogin}  ${EMAIL}

    Wait Until Element Is Visible  ${txt_Password}
    Input Text  ${txt_Password}  ${PASSWORD}

    Wait Until Element Is Visible  ${btn_Login}
    Click Button  ${btn_Login}

Create Account
    ${EMAIL}=  Generate Random Email  8
    ${PASSWORD}=  Generate Random String  10  [LOWER]

    Set Test Variable  ${EMAIL}
    Set Test Variable  ${PASSWORD}

    Wait Until Element Is Visible  ${txt_EmailCreateAcct}
    Input Text  ${txt_EmailCreateAcct}  ${EMAIL}

    Wait Until Element Is Visible  ${btn_CreateAcct}
    Click Button  ${btn_CreateAcct}
