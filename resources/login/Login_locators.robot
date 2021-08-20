*** Variables ***
# Create account
${txt_create_acct_email}    email_create
${btn_create_acct}          SubmitCreate
${lbl_create_acct_error}    create_account_error

# Login
${txt_login_email}          email
${txt_login_password}       passwd
${btn_login}                SubmitLogin
${lbl_login_error}          //div[contains(@class, 'alert-danger')]//li[contains(text(), 'element')]    # Replace element with the error description
