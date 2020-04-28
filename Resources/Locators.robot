*** Variables ***

# Home Page
${btn_SignIn}=  css=.login

# Login Page
${txt_EmailCreateAcct}=  id:email_create
${btn_CreateAcct}=  id:SubmitCreate
${txt_EmailLogin}=  id:email
${txt_Password}=  id:passwd
${btn_Login}=  id:SubmitLogin

# Create An Account - Personal Information
${rad_Title}=  id_gender
${rad_Title_Mr}=  id_gender1
${rad_Title_Mrs}=  id_gender2

${txt_CustFirstName}=  customer_firstname
${txt_CustLastName}=  customer_lastname
${txt_CustEmail}=  email
${txt_CustEmail}=  passwd
${lst_BirthDate_Days}=  id:days
${lst_BirthDate_Month}=  id:months
${lst_BirthDate_Year}=  id:years

${txt_Address_FirstName}=  id:firstname
${txt_Address_LastName}=  id:lastname
${txt_Address}=  id:address1
${txt_Address_City}=  id:city
${lst_Address_State}=  id:id_state
${txt_Address_Zip}=  id:postcode
${lst_Address_Country}=  id:id_country
${txt_Address_AddInfo}=  id:other
${txt_Address_HomePhone}=  id:phone
${txt_Address_MobilePhone}=  id:phone_mobile
${txt_Address_AliasEmail}=  id:alias
${btn_Submit_Account}=  id:submitAccount

# My Account
${btn_MyAcct_Logout}=  a.logout
${btn_TopBar_Dresses}=  css:[title=Dresses]

# Products - Dresses Category
${btn_Summer_Dresses}=  xpath://a[@class='subcategory-name'][contains(text(),'Summer Dresses')]
${mo_SummerDress_Item}=  (//div[@class="product-container"])[${Grid Item}]
${btn_Compare}=  (//button[@type="submit"])[3]
${btn_SummerDress_More}=  (//span[contains(text(),"More")])[${Grid Item}]

# Products - Item Details (More)
${txt_Item_Qty}=  id:quantity_wanted
${lst_Item_Size}=  id:group_1
${btn_Item_Color_White}=  id:color_8
${btn_Item_Color_Yellow}=  id:color_16
${btn_Item_Color_Green}=  id:color_15
${btn_Item_AddToCart}=  //span[contains(text(),'Add to cart')]
${btn_Continue_Shopping}=  //span[@class='continue btn btn-default button exclusive-medium']//span[1]
${btn_GoTo_ShopCart}=  //a[@title="View my shopping cart"]

# Shopping Cart
${lbl_Tot_Amount}=  //span[@id="total_price"]