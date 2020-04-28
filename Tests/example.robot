*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${HOME PAGE URL}  http://automationpractice.com/index.php?id_category=11&controller=category
${TITLE}  Summer Dresses - My Store
${LOCATOR}  (//span[contains(text(),"More")])[2]
#${LOCATOR}  xpath://a[@class='subcategory-name'][contains(text(),'Summer Dresses')]
#/descendant::input[@id="search_query"][2]

*** Test Cases ***
TC01: From Summer Dresses add 4 items to shopping cart
    Open Homepage
    Summer Dresses: Select Item  2
    Add Item to Shopping Cart  1  S  color_8
    Add Item to Shopping Cart  1  L  color_16
    Go To Homepage
    Summer Dresses: Select Item  3
    Add Item to Shopping Cart  1  M  color_15
    Add Item to Shopping Cart  1  L  color_16
    Go To Cart
    Check Total Amount

*** Keywords ***
Go To Homepage
    Go To  ${HOME PAGE URL}

Go To Cart
    Wait Until Element Is Visible  //a[@title="View my shopping cart"]  5
    Click Element  //a[@title="View my shopping cart"]
    Title Should Be  Order - My Store

Open Homepage
    Open Browser  ${HOME PAGE URL}  ${BROWSER}
    Maximize Browser Window
    Title Should Be  ${TITLE}

Check Total Amount
    Wait Until Element Is Visible  //span[@id="total_price"]  5
    ${total amount}=  Get Value  //span[@id="total_price"]
    Log To Console  ${total amount}

Summer Dresses: Select Item
    [Arguments]  ${Grid Item}
    Wait Until Element Is Visible  (//div[@class="product-container"])[${Grid Item}]  5
    Scroll Element Into View  (//button[@type="submit"])[3]
    Mouse Over  (//div[@class="product-container"])[${Grid Item}]
    Wait Until Element Is Visible  (//span[contains(text(),"More")])[${Grid Item}]  5
    Click Element  (//span[contains(text(),"More")])[${Grid Item}]

Add Item to Shopping Cart
    [Arguments]  ${qty}  ${size}  ${color}
    Wait Until Element Is Visible  id:quantity_wanted  5
    Wait Until Element Is Visible  id:uniform-group_1  5
    Wait Until Element Is Visible  id:${color}

    Scroll Element Into View  //span[contains(text(),'Add to cart')]

    Input Text  id:quantity_wanted  ${qty}
    Select From List By Label  id:group_1  ${size}
    Click Element  id:${color}

    Wait Until Element Is Visible  //span[contains(text(),'Add to cart')]  10
    Click Element  //span[contains(text(),'Add to cart')]

    Wait Until Element Is Visible  //span[@class='continue btn btn-default button exclusive-medium']//span[1]  10
    Click Element  //span[@class='continue btn btn-default button exclusive-medium']//span[1]
