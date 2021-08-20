*** Settings ***
Library     SeleniumLibrary    timeout=15s
Variables   ..${/}variables${/}variables.py
Resource    .${/}Login_locators.robot
Resource    ..${/}util${/}Util.robot
Resource    ..${/}my_account${/}MyAccount.robot


*** Keywords ***
Wait login page is ready
    Util.Wait Until Elements Are Visible  ${txt_create_acct_email}  ${btn_create_acct}
    ...  ${txt_login_email}  ${txt_login_password}  ${btn_login}

Login
    [Arguments]    ${user}=default    ${password}=default

    # Get user and password
    ${act_user}  Set Variable If  "${user}" == "default"  ${dict_user}[user]  ${user}
    ${act_password}  Set Variable If  "${password}" == "default"  ${dict_user}[password]  ${password}

    # Login
    Wait login page is ready
    Util.Wait and write into input element  ${txt_login_email}  ${act_user}
    Input Password  ${txt_login_password}  ${act_password}
    Util.Wait and click element  ${btn_login}

Validate login error
    [Arguments]    ${exp_error}

    ${xpath_error}  Replace String  ${lbl_login_error}  element  ${exp_error}
    Wait Until Element Is Visible  ${xpath_error}  error=The following expected error message is not displayed "${exp_error}"
    Capture Page Screenshot

Click Create Account
    [Arguments]    ${email}

    Wait login page is ready
    Util.Wait and write into input element  ${txt_create_acct_email}  ${email}
    Util.Wait and click element  ${btn_create_acct}