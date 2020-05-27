*** Settings ***
Library  SeleniumLibrary
Resource  .${/}Common_variables.robot


*** Variables ***
# Page title
${page_title}=  Order - My Store

# Buttons and clickable elements
# Shopping Cart
${lbl_Tot_Amount}=  //span[@id="total_price"]
${btn_Shop_Cart_Proceed_Checkout}=  (//span[contains(text(),'Proceed to checkout')])[2]
${lbl_Step3_Address}=  //li[@class="step_current third"]
${lbl_Step4_Shipping}=  //li[@class="step_current four"]
${mo_Terms}=  id:uniform-cgv
${chk_Terms}=  id:cgv
${lbl_Step5_Payment}=  //li[@class="step_current last"]
${btn_Pay_Bank_Wire}=  //a[@class='bankwire']
${btn_Confirm_My_Order}=  //span[contains(text(),'I confirm my order')]
${lbl_Order_Confirmation}=  //strong[contains(text(),'Your order on My Store is complete.')]


${txt_Comments}=  //textarea[@name='message']

# Input data fields



*** Keywords ***
Check Total Amount
    [Arguments]  ${operation}  ${exp_total_amount}
    Wait Until Element Is Visible  ${lbl_Tot_Amount}  ${WAIT_TIME}
    ${total amount}=  Get Text  ${lbl_Tot_Amount}
    ${total amount}=  Remove String  ${total amount}  $
    ${total amount}=  Convert to Number  ${total amount}
    Run Keyword If  '${operation}' == 'LESS'  Should Be True  ${total amount} < ${exp_total_amount}
    Run Keyword If  '${operation}' == 'MORE'  Should Be True  ${total amount} > ${exp_total_amount}