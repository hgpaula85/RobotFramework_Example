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

Resource    ..${/}Resources${/}resource.robot

*** Test Cases ***
Buy one single item
    Open Home Page
    Open Login Page
    #Select Create Account
    #Register New Account
    #Sign Out
    #Open Login Page
    Sign In
    Select Products