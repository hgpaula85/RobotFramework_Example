*** Settings ***
Library  SeleniumLibrary
Resource  .${/}Common_variables.robot


*** Variables ***
# Page title
${page_title}=  Summer Dresses - My Store

# Buttons and clickable elements
${mo_SummerDress_Item}=  (//div[@class="product-container"])

# Input data fields



*** Keywords ***
Select Item
    [Arguments]  ${grid_item}

    ${temp_locator}=  Catenate  SEPARATOR=  ${mo_SummerDress_Item}  ${grid_item}
    Wait Until Element Is Visible  ${temp_locator}  ${WAIT_TIME}
    Click Element  ${temp_locator}