*** Settings ***
Library  String
Library  BuiltIn
Library    SeleniumLibrary

Resource  common_variables.robot
Resource  Locators.robot

*** Keywords ***
# Functions
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
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Title Should Be  ${TITLE_HOMEPAGE}

Go To Home Page
    Go To  ${url}

Select Category Dresses - Summer Dresses
    Wait Until Element Is Visible  ${btn_Category_Dresses}  ${WAIT_TIME}
    Click Element  ${btn_Category_Dresses}
    Title Should Be  ${TITLE_DRESSES}

    Wait Until Element Is Visible  ${btn_Category_Dre_SumDresses}  ${WAIT_TIME}
    Click Element  ${btn_Category_Dre_SumDresses}
    Title Should Be  ${TITLE_DRESSES_SUMMER}

Go To Login Page
    Wait Until Element Is Visible  ${btn_sign_in}  ${WAIT_TIME}
    Click Element  ${btn_sign_in}
    Title Should Be  ${TITLE_LOGIN}

Go To My Account
    Wait Until Element Is Visible  ${btn_MyAccount}  ${WAIT_TIME}
    Click Element  ${btn_MyAccount}
    Title Should Be  ${TITLE_MY_ACCT}

Select Create Account
    ${EMAIL}=  Generate Random Email  8
    ${PASSWORD}=  Generate Random String  10  [LOWER]

    Set Test Variable  ${EMAIL}
    Set Test Variable  ${PASSWORD}

    Wait Until Element Is Visible  ${txt_EmailCreateAcct}
    Input Text  ${txt_EmailCreateAcct}  ${EMAIL}

    Wait Until Element Is Visible  ${btn_CreateAcct}
    Click Button  ${btn_CreateAcct}

    Title Should Be  ${TITLE_CREATE_ACCT}

Register New Account
    Wait Until Element Is Visible  ${btn_register}

    Select Radio Button  ${rad_Title}  ${rad_Title_Mrs}
    Input Text  ${txt_pers_info_first_name}  ${FIRST_NAME}
    Input Text  ${txt_pers_info_last_name}  ${LAST_NAME}
    Input Text  ${txt_email}  ${EMAIL}
    Input Text  ${txt_Password}  ${PASSWORD}

    Select From List By Value  ${lst_birth_date_day}  12
    Select From List By Value  ${lst_birth_date_month}  3
    Select From List By Value  ${lst_birth_date_year}  1985

    Input Text  ${txt_address_first_name}  ${FIRST_NAME}
    Input Text  ${txt_address_last_name}  ${LAST_NAME}
    Input Text  ${txt_address}  ${ADDRESS}
    Input Text  ${txt_address_city}  ${CITY}
    Select From List By Label  ${lst_address_state}  Arkansas
    Input Text  ${txt_address_zip}  ${ZIP_CODE}
    Select From List By Value  ${lst_address_country}  21
    Input Text  ${txt_address_add_info}  ${EMAIL}
    Input Text  ${txt_address_home_phone}  ${PHONE}
    Input Text  ${txt_address_mobile_phone}  ${PHONE}
    Input Text  ${txt_address_alias}  ${ADDRESS}

    Click Button  ${btn_register}

    Title Should Be  ${TITLE_MY_ACCT}

Sign Out
    Wait Until Element Is Visible  ${btn_MyAcct_Logout}  ${WAIT_TIME}
    Click Element  ${btn_MyAcct_Logout}
    Title Should Be  ${TITLE_LOGIN}
    Sleep  3

Sign In
    Wait Until Element Is Visible  ${txt_EmailLogin}
    Wait Until Element Is Visible  ${txt_Password}
    Wait Until Element Is Visible  ${btn_Login}

    Input Text  ${txt_EmailLogin}  ${EMAIL}
    Input Text  ${txt_Password}  ${PASSWORD}

    Click Button  ${btn_Login}
    Title Should Be  ${TITLE_MY_ACCT}

Check Total Amount
    [Arguments]  ${operation}  ${exp_total_amount}
    Wait Until Element Is Visible  ${lbl_Tot_Amount}  ${WAIT_TIME}
    ${total amount}=  Get Text  ${lbl_Tot_Amount}
    ${total amount}=  Remove String  ${total amount}  $
    ${total amount}=  Convert to Number  ${total amount}
    Run Keyword If  '${operation}' == 'LESS'  Should Be True  ${total amount} < ${exp_total_amount}
    Run Keyword If  '${operation}' == 'MORE'  Should Be True  ${total amount} > ${exp_total_amount}

Summer Dresses: Select Item
    [Arguments]  ${grid_item}

    ${temp_locator}=  Catenate  SEPARATOR=  ${mo_SummerDress_Item}  ${grid_item}
    Wait Until Element Is Visible  ${temp_locator}  ${WAIT_TIME}
    Wait Until Element Is Visible  ${btn_Compare}
    Scroll Element Into View  ${temp_locator}
    Mouse Over  ${temp_locator}

    ${temp_locator}=  Catenate  SEPARATOR=  ${btn_SummerDress_More}  ${grid_item}
    Wait Until Element Is Visible  ${temp_locator}  ${WAIT_TIME}
    Click Element  ${temp_locator}

Add Item to Shopping Cart
    [Arguments]  ${qty}  ${size}  ${color}  ${next_step}
    Wait Until Element Is Visible  ${txt_Item_Qty}  ${WAIT_TIME}
    Wait Until Element Is Visible  ${mo_Item_Size}  ${WAIT_TIME}
    Wait Until Element Is Visible  ${color}

    Scroll Element Into View  ${btn_Item_AddToCart}

    Input Text  ${txt_Item_Qty}  ${qty}
    Select From List By Label  ${lst_Item_Size}  ${size}
    Click Element  ${color}

    Wait Until Element Is Visible  ${btn_Item_AddToCart}  ${WAIT_TIME}
    Click Element  ${btn_Item_AddToCart}

    Wait Until Element Is Visible  ${next_step}  ${WAIT_TIME}
    Click Element  ${next_step}

Finalize the Order
    Proceed To Checkout
    Check Address and Add Comments
    Shipping
    Select Payment Type
    Confirm the Order

Proceed to Checkout
    # Summary to Address
    Wait Until Element Is Visible  ${btn_Shop_Cart_Proceed_Checkout}
    Click Element  ${btn_Shop_Cart_Proceed_Checkout}
    Title Should Be  ${TITLE_CART}
    Page Should Contain Element  ${lbl_Step3_Address}

Check Address and Add Comments
    # Address to Shipping
    Wait Until Element Is Visible  ${txt_Comments}
    Input Text  ${txt_Comments}  This is a comment for and order.

    Wait Until Element Is Visible  ${btn_Shop_Cart_Proceed_Checkout}
    Click Element  ${btn_Shop_Cart_Proceed_Checkout}
    Title Should Be  ${TITLE_CART}
    Page Should Contain Element  ${lbl_Step4_Shipping}

Shipping
    # Shipping to Payment
    Wait Until Element Is Visible  ${mo_Terms}
    Select Checkbox  ${chk_Terms}

    Wait Until Element Is Visible  ${btn_Shop_Cart_Proceed_Checkout}
    Click Element  ${btn_Shop_Cart_Proceed_Checkout}
    Page Should Contain Element  ${lbl_Step5_Payment}

Select Payment Type
    # Select Payment Type
    Wait Until Element Is Visible  ${btn_Pay_Bank_Wire}
    Click Element  ${btn_Pay_Bank_Wire}

Confirm the Order
    # Confirm the Order
    Wait Until Element Is Visible  ${btn_Confirm_My_Order}
    Click Element  ${btn_Confirm_My_Order}
    Page Should Contain Element  ${lbl_Order_Confirmation}
    Title Should Be  ${TITLE_ORDER_CONFIRMATION}