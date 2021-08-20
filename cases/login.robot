*** Settings ***
Documentation    Login tests with valid and invalid users and passwords
Resource  ..${/}resources${/}util${/}Util.robot
Resource  ..${/}resources${/}home${/}Home.robot
Resource  ..${/}resources${/}login${/}Login.robot
Resource  ..${/}resources${/}my_account${/}MyAccount.robot

Test Setup  Util.Start Test
Test Teardown  Util.Stop Test

*** Test Cases ***
TC01 Login with a valid user and password
    [Documentation]    Login with a valid user and password defined in \resources\variables\user.json
    ...    \nExpected: My Account page should be displayed
    [Tags]    Login    Sanity

    Home.Open Login Page
    Login.Login  user=default  password=default
    MyAccount.Wait My Account page is ready
    Home.Sign Out
    Login.Wait login page is ready

TC02 Login with a valid user and empty password
    [Documentation]    Login with a valid user and empty password
    ...    \nExpected: System should display "Password is required" error message
    [Tags]    Login    Sanity

    Home.Open Login Page
    Login.Login  user=default  password=${EMPTY}
    Login.Validate login error    Password is required


TC03 Login with a valid user and invalid password
    [Documentation]    Login with a valid user and invalid password
    ...    \nExpected: System should display "Authentication failed" error message
    [Tags]    Login    Sanity

    Home.Open Login Page
    Login.Login  user=default  password=abc123
    Login.Validate login error    Authentication failed

TC04 Login with an invalid user and empty password
    [Documentation]    Login with an invalid user and empty password
    ...    \nExpected: System should display "Password is required" error message
    [Tags]    Login    Sanity

    Home.Open Login Page
    Login.Login  user=test@test.zyd  password=${EMPTY}
    Login.Validate login error    Password is required

TC05 Login with an invalid user and password
    [Documentation]    Login with an invalid user and password
    ...    \nExpected: System should display "Authentication failed" error message
    [Tags]    Login    Sanity

    Home.Open Login Page
    Login.Login  user=test@test.zyd  password=abc123
    Login.Validate login error    Authentication failed

TC06 Login with empty user and password
    [Documentation]    Login with empty user and password
    ...    \nExpected: System should display "An email address required" error message
    [Tags]    Login    Sanity

    Home.Open Login Page
    Login.Login  user=${EMPTY}  password=${EMPTY}
    Login.Validate login error    An email address required
