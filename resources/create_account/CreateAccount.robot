*** Settings ***
Library     SeleniumLibrary    timeout=15
Resource    .${/}CreateAccount_locators.robot
Resource    ..${/}common_variables.robot
Resource    ..${/}util${/}Util.robot


*** Keywords ***
Wait Create Account page is ready
    Util.Wait Until Elements Are Visible  ${rad_title}  ${txt_pers_info_first_name}  ${txt_pers_info_last_name}
    ...  ${txt_email}  ${txt_password}
    ...  ${lst_birth_date_day}  ${lst_birth_date_month}  ${lst_birth_date_year}
    ...  ${chk_newsletter}  ${chk_special_offers}
    ...  ${txt_address_first_name}  ${txt_address_last_name}  ${txt_address_company}
    ...  ${txt_address}  ${txt_address_line_2}
    ...  ${txt_address_city}  ${lst_address_state}   ${txt_address_zip}  ${lst_address_country}
    ...  ${txt_address_add_info}   ${txt_address_home_phone}  ${txt_address_mobile_phone}
    ...  ${txt_address_alias}  ${btn_register}

Register New Account
    Wait Create Account page is ready

    ${gender}  Evaluate  random.randint(1,2)
    Select Radio Button  ${rad_title}  ${gender}

    @{lst_first}  Create List  ${txt_pers_info_first_name}  ${txt_address_first_name}
    @{lst_last}   Create List  ${txt_pers_info_last_name}   ${txt_address_last_name}

    FOR  ${element}  IN  ${lst_first}  ${lst_last}
        ${name}  Select random name
        Util.Wait and write into input element  ${element}[0]  ${name}
        Util.Wait and write into input element  ${element}[1]  ${name}
    END

#    Input Text  ${txt_email}  ${EMAIL}
    Input Password  ${txt_password}  Password1

    FOR  ${list}  IN
    ...  ${lst_birth_date_day}
    ...  ${lst_birth_date_month}
    ...  ${lst_birth_date_year}
    ...  ${lst_address_state}
    ...  ${lst_address_country}
        Util.Select Random From List by Label  ${list}  remove_first=${TRUE}
    END



#    Input Text  ${txt_address}  ${ADDRESS}
#    Input Text  ${txt_address_city}  ${CITY}
#    Input Text  ${txt_address_zip}  ${ZIP_CODE}
#    Input Text  ${txt_address_add_info}  ${EMAIL}    # Optional
#    Input Text  ${txt_address_home_phone}  ${PHONE}    # Optional
#    Input Text  ${txt_address_mobile_phone}  ${PHONE}
#    Input Text  ${txt_address_alias}  ${ADDRESS}
#    Click Button  ${btn_register}

    Sleep    10s