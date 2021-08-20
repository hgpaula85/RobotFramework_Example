*** Settings ***
Library  SeleniumLibrary
Resource  .${/}common_variables.robot


*** Variables ***
# Page title


# Buttons and clickable elements
${btn_Category_Dresses}=   xpath:(//a[@class="sf-with-ul" and @title="Dresses"])[2]
${btn_Category_Women}=     xpath://a[@class="sf-with-ul" and @title="Women"]
${btn_Category_TShirts}=   xpath://a[@title="T-shirts"]
${btn_Submit_Search}=      name:submit_search
${btn_MyAccount}=          xpath://a[@title="View my customer account"]
${btn_MyAcct_Logout}=      xpath://a[@class='logout']
${btn_GoTo_ShopCart}=      xpath://div[@class="shopping_cart"]//a[@title="View my shopping cart"]

# Input data fields
${txt_Search}=  id:search_query_top


*** Keywords ***
Select Category Dresses
    Wait Until Element Is Visible  ${btn_Category_Dresses}  ${WAIT_TIME}
    Click Element  ${btn_Category_Dresses}

Select Category Women
    Wait Until Element Is Visible  ${btn_Category_Women}  ${WAIT_TIME}
    Click Element  ${btn_Category_Women}

Select Category T-shirts
    Wait Until Element Is Visible  ${btn_Category_T-Shirts}  ${WAIT_TIME}
    Click Element  ${btn_Category_T-Shirts}

Search Product
    [Arguments]  ${product_name}
    Wait Until Element Is Visible  ${txt_Search}
    Input Text  ${btn_Submit_Search}  ${product_name}

    Wait Until Element Is Visible  ${btn_Submit_Search}
    Click Button  ${btn_Submit_Search}

Go To Shopping Cart
    Wait Until Element Is Visible  ${btn_GoTo_ShopCart}
    Click Button  ${btn_GoTo_ShopCart}

Sign Out
    Wait Until Element Is Visible  ${btn_MyAcct_Logout}  ${WAIT_TIME}
    Click Element  ${btn_MyAcct_Logout}
    Sleep  3 seconds