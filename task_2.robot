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
${vtl}     //*[@class="cq-symbol-select-btn"]
#${si}       //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]

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
    wait until page does not contain element     dt_core_header_acc-info-preloader  60
    wait until page does not contain element       //*[@class="chart-container__loader"]  20
    wait until page contains element    ${vtl}
    click element   ${vtl}
    wait until page does not contain element     dt_core_header_acc-info-preloader  60
    wait until page does not contain element       //*[@class="chart-container__loader"]  20
    wait until page contains element        //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]
    click element   //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]
    sleep   5
    click element       //*[@class="ic-icon ic-1HZ10V"]
    sleep   5
    wait until page contains element     dt_amount_input    20
    click element   dt_amount_input
    press keys      dt_amount_input  CONTROL+A  BACKSPACE
    input text      dt_amount_input     50
    wait until page does not contain element    //*[@id="dt_purchase_call_button" and contains(@class, "btn-purchase--disabled")]    60
    wait until page contains element    //*[text()="Volatility 10 (1s) Index"]      20
    click element   //*[text()="Volatility 10 (1s) Index"]
    wait until page does not contain element    //*[@class="initial-loader initial-loader--fullscreen"]     80
    Wait until page contains element       //*[@name="contract_type" and contains(@value,"rise_fall")]      10
    wait until page does not contain element    //*[@id="dt_purchase_call_button" and contains(@class, "btn-purchase--disabled")]    60
    click button    dt_purchase_call_button


#    Close Browser

*** Test Cases ***

Open Deriv
    Login Deriv     ${my_email}     ${my_pw}
