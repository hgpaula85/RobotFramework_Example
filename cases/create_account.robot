*** Settings ***
Documentation    Create account tests with valid and invalid data
Resource  ..${/}resources${/}util${/}Util.robot
Resource  ..${/}resources${/}home${/}Home.robot
Resource  ..${/}resources${/}login${/}Login.robot
Resource  ..${/}resources${/}create_account${/}CreateAccount.robot

Test Setup  Util.Start Test
Test Teardown  Util.Stop Test

*** Test Cases ***
TC01 Create account with valid data
    [Documentation]    Successfully create an account with valid data
    ...    \nExpected: New account should be created
    [Tags]    CreateAccount    Sanity

    ${email}  Util.Generate Random Email

    Home.Open Login Page
    Login.Click Create Account  ${email}
    CreateAccount.Register New Account


#    MyAccount.Wait My Account page is ready
#    Home.Sign Out
#    Login.Wait login page is ready
