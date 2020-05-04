*** Settings ***
Documentation       This suite contains all tests necessary to buy a single item
...     a) Access web site: http://automationpractice.com/index.php
...     b) Create a new account
...     c) Log in using new account created
...     d) From category “Dresses” select “Summer Dresses”
...     e) Add to shopping cart: 2 pieces from second displayed item
...                             – first item: size S, white color
...                             - second item : size L, yellow color
...     f) Add to shopping cart: 2 pieces from third displayed item
...                             – first item: size M, green color
...                             - second item : size L, yellow color
...     g) Access shipping cart and verify that total amount is under 100$
...     h) Submit/Finalize order
...     User.......:   tqmtlzci@oisnjaxw.com
...     Password...:   aqlnlgkmdr

Library  SeleniumLibrary
Resource  ..${/}Resources${/}Common_variables.robot
Resource  ..${/}Resources${/}Locators.robot
Resource  ..${/}Resources${/}Keywords.robot

Test Setup  Keywords.Start Test
Test Teardown  Keywords.Finish Test

*** Test Cases ***
TC01 Login, add one item to shopping cart and validate total amount is under 50 USD
    [Tags]  Functional  Login
    [Documentation]  Login with an existing user
    ...  Add one item to shopping cart
    ...  Validate total amount is less than 50 USD
    Set Screenshot Directory  ../Reports/screenshots/main/tc01

    Log  Step 1 - Open home page
    Keywords.Open Home Page

    Log  Step 2 - Go to login page
    Keywords.Go To Login Page

    Log  Step 3 - Sign in
    Keywords.Sign In

    Log  Step 4 - Select Dresses/Summer Dresses category
    Select Category Dresses - Summer Dresses

    Log  Step 5 - Select one item
    Keywords.Summer Dresses: Select Item  [2]

    Log  Step 6 - Add item to shopping cart
    Keywords.Add Item to Shopping Cart  1  S  ${btn_Item_Color_White}

    Log  Step 7 - Go to cart and validate total amount is less than 50 USD
    Keywords.Go To Cart
    Keywords.Check Total Amount  LESS  50

    Log  Step 8 - Finalize order
    Keywords.Finalize the order


TC02 Login, add two different items to shopping cart and validate total amount is over 50 USD
    [Tags]  Functional  Login
    [Documentation]  Login with an existing user
    ...  Add two different items to shopping cart
    ...  Validate total amount is greater than 50 USD
    Set Screenshot Directory  ../Reports/screenshots/main/tc02

    Log  Step 1 - Open home page
    Keywords.Open Home Page

    Log  Step 2 - Go to login page
    Keywords.Go To Login Page

    Log  Step 3 - Sign in
    Keywords.Sign In

    Log  Step 4 - Select Dresses/Summer Dresses category
    Select Category Dresses - Summer Dresses

    Log  Step 5 - Select second item on the grid
    Keywords.Summer Dresses: Select Item  [2]

    Log  Step 6 - Add two different sizes and colors items to shopping cart
    Keywords.Add Item to Shopping Cart  1  S  ${btn_Item_Color_White}
    Keywords.Add Item to Shopping Cart  1  L  ${btn_Item_Color_Yellow}

    Log  Step 7 - Go to cart and validate total amount is greater than 50 USD
    Keywords.Go To Cart
    Keywords.Check Total Amount  MORE  50

    Log  Step 8 - Finalize order
    Keywords.Finalize the order

TC03 Create new account, add four different items to shopping cart and validate total amount is under 100 USD
    [Tags]  Functional  Login
    [Documentation]  Create new account
    ...  Add two different items to shopping cart
    ...  Validate total amount is under 100 USD
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
    Keywords.Add Item to Shopping Cart  1  S  ${btn_Item_Color_White}
    Keywords.Add Item to Shopping Cart  1  L  ${btn_Item_Color_Yellow}

    Log  Step 6 - Select Dresses/Summer Dresses category
    Keywords.Go To My Account
    Select Category Dresses - Summer Dresses

    Log  Step 7 - Select third item on the grid
    Keywords.Summer Dresses: Select Item  [3]

    Log  Step 8 - Add two different sizes and colors items to shopping cart
    Keywords.Add Item to Shopping Cart  1  M  ${btn_Item_Color_Green}
    Keywords.Add Item to Shopping Cart  1  L  ${btn_Item_Color_Yellow}

    Log  Step 9 - Go to cart and validate total amount is under 100 USD
    Keywords.Go To Cart
    Keywords.Check Total Amount  LESS  100

    Log  Step 10 - Finalize order
    Keywords.Finalize the order