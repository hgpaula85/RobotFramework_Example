*** Settings ***
Library  SeleniumLibrary
Resource  .${/}common_variables.robot


*** Variables ***
# Page title
${page_title}=  Dresses - My Store

# Buttons and clickable elements
${btn_Summer_Dresses}=   xpath://a[@class='subcategory-name'][contains(text(),'Summer Dresses')]
${btn_Evening_Dresses}=  xpath://a[@class='subcategory-name'][contains(text(),'Evening Dresses')]
${btn_Casual_Dresses}=   xpath://a[@class='subcategory-name'][contains(text(),'Casual Dresses')]

# Input data fields



*** Keywords ***
Select Subcategory Summer Dresses
    Wait Until Element Is Visible  ${btn_Summer_Dresses}  ${WAIT_TIME}
    Click Element  ${btn_Summer_Dresses}

Select Subcategory Evening Dresses
    Wait Until Element Is Visible  ${btn_Evening_Dresses}  ${WAIT_TIME}
    Click Element  ${btn_Evening_Dresses}

Select Subcategory Casual Dresses
    Wait Until Element Is Visible  ${btn_Casual_Dresses}  ${WAIT_TIME}
    Click Element  ${btn_Casual_Dresses}