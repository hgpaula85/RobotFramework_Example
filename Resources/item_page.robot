*** Settings ***
Library  SeleniumLibrary
Resource  .${/}Common_variables.robot
Resource  .${/}util.robot

*** Variables ***
# Page title


# Color List
    # White = 8
    # Yellow = 16
    # Green = 15

# Buttons and clickable elements
${mo_Item_Size}=           uniform-group_1
${lst_Item_Size}=          id:group_1
${btn_Item_Color}=         id:color_
${btn_Item_AddToCart}=     xpath://span[contains(text(),'Add to cart')]
${btn_Continue_Shopping}=  xpath://span[@class='continue btn btn-default button exclusive-medium']//span[1]
${btn_Proceed_Checkout}=   xpath://span[contains(text(),'Proceed to checkout')]

# Input data fields
${txt_Item_Qty}=  id:quantity_wanted


*** Keywords ***
Add Item to Shopping Cart
    [Arguments]  ${qty}  ${size}  ${color_id}  ${next_step}

    Wait Until Element Is Visible  ${btn_Item_AddToCart}
    Scroll Element Into View  ${btn_Item_AddToCart}

    Wait Until Element Is Visible  ${txt_Item_Qty}  ${WAIT_TIME}
    Input Text  ${txt_Item_Qty}  ${qty}

    Wait Until Element Is Visible  ${mo_Item_Size}  ${WAIT_TIME}
    Select From List By Label  ${lst_Item_Size}  ${size}

    ${color_locator}=  Catenate  SEPARATOR=  ${btn_Item_Color}  ${color_id}
    Wait Until Element Is Visible  ${color_locator}
    Click Element  ${color_locator}

    Wait Until Element Is Visible  ${btn_Item_AddToCart}  ${WAIT_TIME}
    Click Element  ${btn_Item_AddToCart}

    # Next step can be 'Continue shopping' or 'Proceed to checkout'
    Run Keyword If  '${next_step}' == 'Continue Shopping'  Continue Shopping
    ...  ELSE IF  '${next_step}' == 'Proceed to checkout'  Proceed to Checkout
    ...  ELSE  util.Exit

Continue Shopping
    Wait Until Element Is Visible  ${btn_Continue_Shopping}
    Click Element  ${btn_Continue_Shopping}

Proceed to Checkout
    Wait Until Element Is Visible  ${btn_Proceed_Checkout}
    Click Element  ${btn_Proceed_Checkout}
