*** Variables ***
# Personal Information
${rad_title}                    id_gender
${txt_pers_info_first_name}     //input[@id = 'customer_firstname']
${txt_pers_info_last_name}      //input[@id = 'customer_lastname']
${txt_email}                    //input[@id = 'email']
${txt_password}                 //input[@id = 'passwd']
${lst_birth_date_day}           //select[@id = 'days']
${lst_birth_date_month}         //select[@id = 'months']
${lst_birth_date_year}          //select[@id = 'years']
${chk_newsletter}               //input[@id = 'newsletter']
${chk_special_offers}           //input[@id = 'optin']

# Your Address
${txt_address_first_name}       //input[@id = 'firstname']
${txt_address_last_name}        //input[@id = 'lastname']
${txt_address_company}          //input[@id = 'company']
${txt_address}                  //input[@id = 'address1']
${txt_address_line_2}           //input[@id = 'address2']
${txt_address_city}             //input[@id = 'city']
${lst_address_state}            //div[@id = 'uniform-id_state']
${txt_address_zip}              //input[@id = 'postcode']
${lst_address_country}          id:uniform-id_country
${txt_address_add_info}         //textarea[@id = 'other']
${txt_address_home_phone}       //input[@id = 'phone']
${txt_address_mobile_phone}     //input[@id = 'phone_mobile']
${txt_address_alias}            //input[@id = 'alias']
${btn_register}                 //button[@id = 'submitAccount']
