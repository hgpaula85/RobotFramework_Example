*** Settings ***
Library     SeleniumLibrary    timeout=15s
Resource    .${/}MyAccount_locators.robot
Resource    ..${/}common_variables.robot
Resource    ..${/}util${/}Util.robot


*** Keywords ***
Wait My Account page is ready
    Util.Wait Until Elements Are Visible  ${btn_order_history}  ${btn_credit_slips}  ${btn_addresses}
    ...  ${btn_personal_info}  ${btn_wishlists}  ${btn_home}
