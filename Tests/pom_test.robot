*** Settings ***
Documentation
...    Testing the Page Object Model with Robot Framework

Library     SeleniumLibrary
Library     String

Resource  ..${/}Resources${/}util.robot
Resource  ..${/}Resources${/}Common_variables.robot
Resource  ..${/}Resources${/}landing_page.robot
Resource  ..${/}Resources${/}login_page.robot
Resource  ..${/}Resources${/}header_page.robot
Resource  ..${/}Resources${/}dresses_page.robot
Resource  ..${/}Resources${/}summer_dresses.robot
Resource  ..${/}Resources${/}item_page.robot
Resource  ..${/}Resources${/}shopping_cart_page.robot

#Test Setup  Keywords.Start Test
Test Teardown  util.Exit


*** Variables ***
${BROWSER}  firefox

*** Test Cases ***
TC01 - Page Object Model test case
    Set Screenshot Directory  ../Reports/screenshots/pom/tc01
    Log  Step 1 - Open home page and sing-in
        landing_page.Open Home Page
        landing_page.Sign In
        login_page.Sign In


     Log  Step 2 - Select Dresses - Summer Dresses
        header_page.Select Category Dresses
        dresses_page.Select Subcategory Summer Dresses

    Log  Step 3 - Select second product on the grid
        summer_dresses.Select Item  [2]


    Log  Step 4 - Add item to shopping cart
        item_page.Add Item to Shopping Cart  1  S  8  Proceed to checkout


    Log  Step 5 - Validate total amount is less than 50 USD
        shopping_cart_page.Check Total Amount  LESS  50

#    Log  Step 6 - Finalize order
