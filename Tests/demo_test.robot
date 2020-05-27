*** Settings ***
Documentation
...    This suite contains all tests necessary to buy an item.
...    \n1. Access web site: http://automationpractice.com/index.php.
...    \n2. Create a new account.
...    \n3. Log in using new account created.
...    \n4. From category “Dresses” select “Summer Dresses”.
...    \n5. Add to shopping cart: 2 pieces from second displayed item
...
...    - first item: size S, white color\n- second item : size L, yellow color

Library     SeleniumLibrary
Library  String

Test Teardown  Close Browser


*** Variables ***
${BROWSER}  internetexplorer
#${BROWSER}  chrome
#${BROWSER}  firefox

${HOME PAGE URL}  http://automationpractice.com/index.php?id_category=11&controller=category
${BTN_CLICK}  //div[contains(@class, 'bottom-pagination')] //form[@class='compare-form']


*** Test Cases ***
Open and close browser
    #Set Screenshot Directory  ../Reports

    Open Browser  ${HOME PAGE URL}  ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible  ${BTN_CLICK}  10
    Click Element  ${BTN_CLICK}

    Close Window

