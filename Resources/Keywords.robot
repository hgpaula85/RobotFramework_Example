*** Settings ***
Library  ..${/}Resources${/}Variables.robot
Library  ..${/}Resources${/}Locators.robot

*** Keywords ***
# Functions
Start Test
    ${FIRST NAME}=  Generate Random String  10  [LOWER]
    ${LAST NAME}=  Generate Random String  12  [LOWER]
    ${ZIP CODE}=  Generate Random String  5  [NUMBERS]
    ${PHONE}=  Generate Random String  10  [NUMBERS]

Generate Random Email
    [Documentation]  Receive string lenght and return a random_email
    [Arguments]  ${length}
    ${random_uname}=  generate random string  ${length}  [LOWER]
    ${random_domain}=  generate random string  ${length}  [LOWER]
    ${random_email}=  catenate  SEPARATOR=@  ${random_uname}  ${random_domain}
    ${random_email}=  catenate  SEPARATOR=.  ${random_email}  com
    [Return]  ${random_email}


# Web site standard navigation
Open Home Page
    Open Browser  ${HOME PAGE URL}  ${BROWSER}
    Maximize Browser Window
    Title Should Be  ${TITLE_HOMEPAGE}

Go To Home Page
    Go To  ${HOME PAGE URL}

Go To Cart
    Wait Until Element Is Visible  ${btn_GoTo_ShopCart}  ${WAIT_TIME}
    Click Element  ${btn_GoTo_ShopCart}
    Title Should Be  ${TITLE_CART}

Go To Login Page
    Wait Until Element Is Visible  ${btn_SignIn}  ${WAIT_TIME}
    Click Element  ${btn_SignIn}
    Title Should Be  ${TITLE_LOGIN}

Select Create Account
    ${EMAIL}=  Generate Random Email  8
    Set Test Variable  ${EMAIL}

    Wait Until Element Is Visible  ${txt_EmailCreateAcct}
    Input Text  ${txt_EmailCreateAcct}  ${EMAIL}

    Wait Until Element Is Visible  ${btn_CreateAcct}
    Click Button  ${btn_CreateAcct}

    Title Should Be  ${TITLE_CREATE_ACCT}

Register New Account
    ${PASSWORD}=  Generate Random String  10  [LOWER]
    Set Test Variable  ${PASSWORD}

    Select Radio Button  ${rad_Title}  ${rad_Title_Mrs}
    Input Text  ${txt_CustFirstName}  ${FIRST NAME}
    Input Text  ${txt_CustLastName}  ${LAST NAME}
    Input Text  ${txt_CustEmail}  ${EMAIL}
    Input Text  ${txt_CustEmail}  ${PASSWORD}

    Select From List By Value  ${lst_BirthDate_Days}  12
    Select From List By Value  ${lst_BirthDate_Month}  3
    Select From List By Value  ${lst_BirthDate_Year}  1985

    Input Text  ${txt_Address_FirstName}  ${FIRST NAME}
    Input Text  ${txt_Address_LastName}  ${LAST NAME}
    Input Text  ${txt_Address}  ${ADDRESS}
    Input Text  ${txt_Address_City}  ${CITY}
    Select From List By Label  ${lst_Address_State}  Arkansas
    Input Text  ${txt_Address_Zip}  ${ZIP CODE}
    Select From List By Value  ${lst_Address_Country}  21
    Input Text  ${txt_Address_AddInfo}  ${EMAIL}
    Input Text  ${txt_Address_HomePhone}  ${PHONE}
    Input Text  ${txt_Address_MobilePhone}  ${PHONE}
    Input Text  ${txt_Address_AliasEmail}  ${ADDRESS}

    Click Button  ${btn_Submit_Account}

    Title Should Be  ${TITLE_MY_ACCT}

Sign Out
    Wait Until Element Is Visible  ${btn_MyAcct_Logout}  ${WAIT_TIME}
    Click Element  ${btn_MyAcct_Logout}
    Title Should Be  ${TITLE_LOGIN}

Sign In
    Wait Until Element Is Visible  ${txt_EmailLogin}
    Wait Until Element Is Visible  ${txt_Password}
    Wait Until Element Is Visible  ${btn_Login}

    Input Text  ${txt_EmailLogin}  ${EMAIL}
    Input Text  ${txt_Password}  ${PASSWORD}

    Click Button  ${btn_Login}
    Title Should Be  ${TITLE_MY_ACCT}

Check Total Amount
    Wait Until Element Is Visible  ${lbl_Tot_Amount}  ${WAIT_TIME}
    ${total amount}=  Get Value  ${lbl_Tot_Amount}
    Log To Console  ${total amount}

Summer Dresses: Select Item
    [Arguments]  ${Grid Item}
    Wait Until Element Is Visible  ${mo_SummerDress_Item}  ${WAIT_TIME}
    Scroll Element Into View  ${btn_Compare}
    Mouse Over  ${mo_SummerDress_Item}
    Wait Until Element Is Visible  ${btn_SummerDress_More}  ${WAIT_TIME}
    Click Element  ${btn_SummerDress_More}

Add Item to Shopping Cart
    [Arguments]  ${qty}  ${size}  ${color}
    Wait Until Element Is Visible  ${txt_Item_Qty}  ${WAIT_TIME}
    Wait Until Element Is Visible  ${lst_Item_Size}  ${WAIT_TIME}
    Wait Until Element Is Visible  ${color}

    Scroll Element Into View  ${btn_Item_AddToCart}

    Input Text  ${txt_Item_Qty}  ${qty}
    Select From List By Label  ${lst_Item_Size}  ${size}
    Click Element  ${color}

    Wait Until Element Is Visible  ${btn_Item_AddToCart}  ${WAIT_TIME}
    Click Element  ${btn_Item_AddToCart}

    Wait Until Element Is Visible  ${btn_Continue_Shopping}  ${WAIT_TIME}
    Click Element  ${btn_Continue_Shopping}
