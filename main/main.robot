*** Settings ***
Documentation
...    This suite contains 3 tests:
...    \n1. Buy 1 item;
...    \n2. Buy 2 items from same category;
...    \n3. Buy 4 items from 2 different categories.

Library  SeleniumLibrary
Resource  ..${/}Resources${/}Common_variables.robot
Resource  ..${/}Resources${/}Locators.robot
Resource  ..${/}Resources${/}Keywords.robot

Test Setup  Keywords.Start Test
Test Teardown  Keywords.Finish Test

*** Test Cases ***
TC01 Login, add one item to shopping cart and validate total amount is under 50 USD
    [Tags]  Functional  Login
    [Documentation]
    ...  Login with the existing user: ${EMAIL} / ${PASSWORD}
    ...  \nAdd one item to shopping cart
    ...  \nValidate total amount is under 50 USD

    Set Screenshot Directory  ../Reports/screenshots/main/tc01

    Log  Step 1 - Open home page and sing-in
    Keywords.Open Home Page
    Keywords.Go To Login Page
    Keywords.Sign In

    Log  Step 2 - Select Dresses/Summer Dresses category
    Select Category Dresses - Summer Dresses

    Log  Step 3 - Select second subcategory on grid
    Keywords.Summer Dresses: Select Item  [2]

    Log  Step 4 - Add item to shopping cart
    Keywords.Add Item to Shopping Cart  1  S  ${btn_Item_Color_White}  ${btn_Proceed_Checkout}

    Log  Step 5 - Validate total amount is less than 50 USD
    Keywords.Check Total Amount  LESS  50

    Log  Step 6 - Finalize order
    Keywords.Finalize the order

TC02 Login, add two different items to shopping cart and validate total amount is over 50 USD
    [Tags]  Functional  Login
    [Documentation]
    ...  Login with the existing user: ${EMAIL} / ${PASSWORD}
    ...  \nAdd two items to shopping cart
    ...  \nValidate total amount is over 50 USD

    Set Screenshot Directory  ../Reports/screenshots/main/tc03

    Log  Step 1 - Open home page and sing-in
    Keywords.Open Home Page
    Keywords.Go To Login Page
    Keywords.Sign In

    Log  Step 2 - Select Dresses/Summer Dresses category
    Select Category Dresses - Summer Dresses

    Log  Step 3 - Select second subcategory on grid
    Keywords.Summer Dresses: Select Item  [2]

    Log  Step 4 - Add two different sizes and colors items to shopping cart
    Keywords.Add Item to Shopping Cart  1  S  ${btn_Item_Color_White}   ${btn_Continue_Shopping}
    Keywords.Add Item to Shopping Cart  1  L  ${btn_Item_Color_Yellow}  ${btn_Proceed_Checkout}

    Log  Step 5 - Validate total amount is greater than 50 USD
    Keywords.Check Total Amount  MORE  50

    Log  Step 6 - Finalize order
    Keywords.Finalize the order

TC03 Create new account, add four different items to shopping cart and validate total amount is under 100 USD
    [Tags]  Functional  Login
    [Documentation]
    ...  Create new user
    ...  \nAdd four different items from different categories to shopping cart
    ...  \nValidate total amount is under 100 USD

    Set Screenshot Directory  ../Reports/screenshots/main/tc03

    Log  Step 1 - Open home page and go to login
    Keywords.Open Home Page
    Keywords.Go To Login Page

    Log  Step 2 - Register new account
    Keywords.Select Create Account
    Keywords.Register New Account

    Log  Step 3 - Select Dresses/Summer Dresses category
    Select Category Dresses - Summer Dresses

    Log  Step 4 - Select second item on the grid
    Keywords.Summer Dresses: Select Item  [2]

    Log  Step 5 - Add two different sizes and colors items to shopping cart
    Keywords.Add Item to Shopping Cart  1  S  ${btn_Item_Color_White}   ${btn_Continue_Shopping}
    Keywords.Add Item to Shopping Cart  1  L  ${btn_Item_Color_Yellow}  ${btn_Continue_Shopping}

    Log  Step 6 - Select Dresses/Summer Dresses category
    Keywords.Go To My Account
    Select Category Dresses - Summer Dresses

    Log  Step 7 - Select third item on the grid
    Keywords.Summer Dresses: Select Item  [3]

    Log  Step 8 - Add two different sizes and colors items to shopping cart
    Keywords.Add Item to Shopping Cart  1  M  ${btn_Item_Color_Green}   ${btn_Continue_Shopping}
    Keywords.Add Item to Shopping Cart  1  L  ${btn_Item_Color_Yellow}  ${btn_Proceed_Checkout}

    Log  Step 9 - Validate total amount is under 100 USD
    Keywords.Check Total Amount  LESS  100

    Log  Step 10 - Finalize order
    Keywords.Finalize the order