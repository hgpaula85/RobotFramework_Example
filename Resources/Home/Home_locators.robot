*** Variables ***
# Header
${btn_sale}                     //header//div[@class = 'banner']//a
${lbl_call_us}                  //header//span[@class = 'shop-phone']
${btn_contact_us}               //header//div[@id='contact-link']
${btn_sign_in}                  //header//div[@class = 'header_user_info']
${btn_logo}                     //header//div[@id = 'header_logo']
${txt_search}                   //header//input[@id = 'search_query_top']
${btn_search}                   //header//button[@name = 'submit_search']
${btn_shop_cart}                //header//div[@class = 'shopping_cart']/a
${lbl_categories}               //header//div[@id = 'block_top_menu']
${btn_cat_women}                ${lbl_categories}//a[@title = 'Women']
${btn_cat_dresses}              ${lbl_categories}/ul/li/a[@title = 'Dresses']
${btn_cat_tshirts}              ${lbl_categories}/ul/li/a[@title = 'T-shirts']

# Footer
${txt_email_news}               //footer//input[@id = 'newsletter-input']
${btn_facebook}                 //footer//li[@class = 'facebook']/a
${btn_twitter}                  //footer//li[@class = 'twitter']/a
${btn_youtube}                  //footer//li[@class = 'youtube']/a
${btn_google_plus}              //footer//li[@class = 'google-plus']/a
${btn_foot_women}               //footer //span[@class = 'grower CLOSE']
${btn_foot_specials}            //footer //a[@title= 'Specials']
${btn_foot_new_prd}             //footer //a[@title= 'New products']
${btn_foot_best_sell}           //footer //a[@title= 'Best sellers']
${btn_foot_our_stores}          //footer //a[@title= 'Our stores']
${btn_foot_contact_us}          //footer //a[@title= 'Contact us']
${btn_foot_terms}               //footer //a[@title= 'Terms and conditions of use']
${btn_foot_about_us}            //footer //a[@title= 'About us']
${btn_foot_sitemap}             //footer //a[@title= 'Sitemap']
${btn_foot_my_orders}           //footer //a[@title= 'My orders']
${btn_foot_my_credit_slips}     //footer //a[@title= 'My credit slips']
${btn_foot_my_addressess}       //footer //a[@title= 'My addresses']
${btn_foot_my_personal_info}    //footer //a[@title= 'Manage my personal information']

# Shopping cart
${lbl_shop_cart_card}           //div[@class = 'block_content']
${lbl_shipping_value}           ${lbl_shop_cart_card}//span[contains(text(), 'Shipping')]/preceding-sibling::span
${lbl_total_value}              ${lbl_shop_cart_card}//span[contains(text(), 'Total')]/preceding-sibling::span
${btn_checkout}                 ${lbl_shop_cart_card}

# Shopping cart - product info (dynamic)
${lbl_prd_info}                 //div[@class = 'block_content']//dl[@class = 'products']
${lbl_prd_name}                 ${lbl_prd_info}//a[@class = 'cart_block_product_name']
${lbl_prd_qty}                  ${lbl_prd_info}//span[@class = 'quantity']
${lbl_prd_details}              ${lbl_prd_info}//a[@title = 'Product detail']
${lbl_prd_price}                ${lbl_prd_info}//span[@class = 'price']
${btn_remove}                   ${lbl_prd_info}//a[contains(@class, 'remove_link')]