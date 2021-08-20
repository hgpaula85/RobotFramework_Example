*** Settings ***
Library     SeleniumLibrary    timeout=15
Resource    .${/}Home_locators.robot
Resource    ..${/}common_variables.robot
Resource    ..${/}util${/}Util.robot


*** Keywords ***
Wait home page is ready
    Util.Wait Until Elements Are Visible  ${btn_sale}  ${lbl_call_us}  ${btn_contact_us}  ${btn_sign_in}
    ...  ${btn_logo}  ${txt_search}  ${btn_search}  ${btn_shop_cart}
    ...  ${btn_cat_women}  ${btn_cat_dresses}  ${btn_cat_tshirts}
    ...  ${txt_email_news}  ${btn_facebook}  ${btn_twitter}  ${btn_youtube}  ${btn_google_plus}
    ...  ${btn_foot_women}
    ...  ${btn_foot_specials}  ${btn_foot_new_prd}  ${btn_foot_best_sell}  ${btn_foot_our_stores}
    ...  ${btn_foot_contact_us}  ${btn_foot_terms}  ${btn_foot_about_us}  ${btn_foot_sitemap}
    ...  ${btn_foot_my_orders}  ${btn_foot_my_credit_slips}  ${btn_foot_my_addressess}  ${btn_foot_my_personal_info}

Open Home Page
    Go To  ${url}
    Wait home page is ready

Open Login Page
    Util.Wait and click element  ${btn_sign_in}

Sign Out
    Util.Wait and click element  ${btn_sign_out}
