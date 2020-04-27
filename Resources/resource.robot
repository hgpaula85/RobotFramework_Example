*** Settings ***
Library  String
Library  BuiltIn
Library  SeleniumLibrary


*** Variables ***
${BROWSER}  chrome
${EMAIL}  tqmtlzci@oisnjaxw.com
${HOME PAGE URL}  http://automationpractice.com/index.php
${LOGIN URL}    http://automationpractice.com/index.php?controller=authentication&back=my-account
${WELCOME URL}  http://automationpractice.com/index.php
${ERROR URL}    http://automationpractice.com/index.php?controller=authentication
${FIRST NAME}
${LAST NAME}
${ADDRESS}  StreetName,${SPACE}99
${CITY}  Bentonville
${PASSWORD}  aqlnlgkmdr
${ZIP CODE}
${PHONE}

*** Keywords ***
Generate Random Email
    [Arguments]  ${length}
    ${random uname}=  generate random string  ${length}  [LOWER]
    ${random domain}=  generate random string  ${length}  [LOWER]
    ${random email}=  catenate  SEPARATOR=@  ${random uname}  ${random domain}
    ${random email}=  catenate  SEPARATOR=.  ${random email}  com
    [Return]  ${random email}

Open Home Page
    Open Browser  ${HOME PAGE URL}  ${BROWSER}
    Maximize Browser Window
    Title Should Be     My Store

Open Login Page
    Wait Until Element Is Visible  css=.login  10
    Click Element  css=.login
    Title Should Be  Login - My Store

Select Create Account
    Wait Until Element Is Visible   email_create

    ${EMAIL}=  Generate Random Email  8
    set test variable  ${EMAIL}

    Input Text      id:email_create     ${EMAIL}
    Click Button  id:SubmitCreate
    Wait Until Element Is Visible  id:submitAccount
    Element Should Be Visible  id:submitAccount
    log to console  CreateAcct Email: ${EMAIL}

Register New Account
    ${FIRST NAME}=  generate random string  10  [LOWER]
    ${LAST NAME}=  generate random string  12  [LOWER]
    ${PASSWORD}=  Generate Random String  10  [LOWER]
    set test variable  ${PASSWORD}
    ${ZIP CODE}=  Generate Random String  5  [NUMBERS]
    ${PHONE}=  Generate Random String  10  [NUMBERS]

    Select Radio Button  id_gender  id_gender1
    Input Text  id:customer_firstname  ${FIRST NAME}
    Input Text  id:customer_lastname  ${LAST NAME}
    Input Text  id:email  ${EMAIL}
    Input Text  id:passwd  ${PASSWORD}

    Select From List By Value  id:days  12
    Select From List By Value  id:months  3
    Select From List By Value  id:years  1985

    Input Text  id:firstname  ${FIRST NAME}
    Input Text  id:lastname  ${LAST NAME}
    Input Text  id:address1  ${ADDRESS}
    Input Text  id:city  ${CITY}
    Select From List By Label  id:id_state  Arkansas
    Input Text  id:postcode  ${ZIP CODE}
    Select From List By Value  id:id_country  21
    Input Text  id:other  ${EMAIL}   
    Input Text  id:phone  ${PHONE}
    Input Text  id:phone_mobile  ${PHONE}
    Input Text  id:alias  ${ADDRESS}

    Click Button  id:submitAccount

    log to console  RegisterAcct Email: ${EMAIL}
    Title Should Be  My account - My Store

Sign Out
    Wait Until Element Is Visible  css:a.logout  10
    Click Element  css=.logout
    Title Should Be  Login - My Store

Sign In
    Wait Until Element Is Visible   id:email
    Wait Until Element Is Visible   id:passwd
    Wait Until Element Is Visible  id:SubmitLogin

    Input Text  id:email  ${EMAIL}
    Input Text  id:passwd  ${PASSWORD}

    log to console  SignIn Email: ${EMAIL}
    log to console  SignIn Passw: ${PASSWORD}

    Click Button  id:SubmitLogin
    Title Should Be  My account - My Store

Select Products
    Wait Until Page Contains Element  css:[title=Dresses]  10
    Wait Until Element Is Enabled  xpath://div[@id='block_top_menu']/ul/li[2]/a  10
    Click Link  xpath://div[@id='block_top_menu']/ul/li[2]/a
    Wait Until Element Is Enabled  xpath://a[@class='subcategory-name'][contains(text(),'Summer Dresses')]  10
    Click Link  xpath://a[@class='subcategory-name'][contains(text(),'Summer Dresses')]





