*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${HOME PAGE URL}  http://automationpractice.com/index.php?id_category=11&controller=category
${TITLE}  Summer Dresses - My Store
${LOCATOR}  xpath:/descendant::div[@class='product-container'][2]
#${LOCATOR}  xpath://a[@class='subcategory-name'][contains(text(),'Summer Dresses')]
#/descendant::input[@id="search_query"][2]

*** Test Cases ***
Test Case 1
    Open Homepage
    Change From Grid to List
    Wait Until Element Is Enabled  ${LOCATOR}  10
    Scroll Element Into View  ${LOCATOR}
    Mouse Over  ${LOCATOR}
    Wait Until Element Is Enabled  /descendant::a[@title='View'][2]  3
    #Click Link  /descendant::a[@title='View'][2]

*** Keywords ***
Open Homepage
    Open Browser  ${HOME PAGE URL}  ${BROWSER}
    Maximize Browser Window
    Title Should Be  ${TITLE}

Change From Grid to List
    Wait Until Element is Enabled  //i[@class='icon-th-list']  5
    Click Element  //i[@class='icon-th-list']