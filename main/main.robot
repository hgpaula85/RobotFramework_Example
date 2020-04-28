*** Settings ***
Library  SeleniumLibrary
Variables  ..${/}Resources${/}Variables.robot
Resource  ..${/}Resources${/}Locators.robot
Resource  ..${/}Resources${/}Keywords.robot

Test Setup  Keywords.Start Test

*** Test Cases ***
TC01 Login, add one product to shopping cart and validate total amount is less than 50 USD
    [Tags]  Functional  Login
    [Documentation]  Login with an existing user
    ...  Add one item to shopping cart
    ...  Validate total amount is less than 50 USD
    Set Screenshot Directory  ../Reports/screenshots/main/tc01