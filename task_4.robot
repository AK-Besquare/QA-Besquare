*** Settings ***

Library     SeleniumLibrary

*** Variable ***
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${login_oauth_btn}  //*[text()="Log in"]
${dropdown}     dt_core_account-info_acc-info
${v_switch}     //*[@id="dt_core_account-switcher_demo-tab"]
${da}       //*[@id="dt_VRTC4795360"]/span

*** Keyword ***

Login Deriv
    [arguments]      ${my_email}     ${my_pw}
    Open Browser     https://app.deriv.com  chrome
    maximize browser window
#   wait until page does not contain element dt_core_header_acc-info-preloader  60
    wait until page contains element    ${login_btn}      60
    click element   ${login_btn}
    wait until page contains element    ${email_field}  15
    input text      ${email_field}  ${my_email}
    input text      ${pw_field}     ${my_pw}
    click element   ${login_oauth_btn}
    wait until page does not contain element     dt_core_header_acc-info-preloader  60
    click element      ${dropdown}
    click element   ${v_switch}
    click element   ${da}
    reload page
    wait until page does not contain element    //*[@class="chart-container__loader"]   30
    click element   //*[@class="cq-symbol-select-btn"]
    click element   //*[@class="ic-icon ic-forex"]
    click element   //*[@class="ic-frx ic-frxAUDUSD"]
    wait until page does not contain element    //*[@class="chart-container__loader"]   30
    click element   dt_contract_dropdown
    click element   dt_contract_high_low_item
    wait until page does not contain element    //*[@class="chart-container__loader"]   30
    click element   dt_simple_toggle
    press keys     name=duration   BACKSPACE
    input text     name=duration    2
    press keys     dt_barrier_1_input  CONTROL+A    BACKSPACE
    input text      dt_barrier_1_input     -0.1
    click element   dc_payout_toggle_item
    press keys      dt_amount_input  CONTROL+A  BACKSPACE
    input text      dt_amount_input     10.50
#    wait until element is disnabled   dt_purchase_put_button  60
    click element   dt_purchase_put_button
#    Close Browser

*** Test Cases ***

Open Deriv
    Login Deriv     ${my_email}     ${my_pw}