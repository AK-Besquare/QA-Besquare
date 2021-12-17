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
    Open Browser     https://app.deriv.com/account/api-token    chrome
    maximize browser window
#   wait until page does not contain element dt_core_header_acc-info-preloader  60
#    wait until page contains element    ${login_btn}      60
#    click element   ${login_btn}
    wait until page contains element    ${email_field}  15
    input text      ${email_field}  ${my_email}
    input text      ${pw_field}     ${my_pw}
    click element   ${login_oauth_btn}
    wait until page does not contain element     dt_core_header_acc-info-preloader  60
    click element      ${dropdown}
    click element   ${v_switch}
    click element   ${da}
    wait until page contains element    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]   30
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]/label/span[1]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]/label/span[1]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]/label/span[1]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]/label/span[1]
    input text      //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input  Ak123
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
    wait until page contains element    //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]      30
    click element                       //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]
    wait until page contains element    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/button    30
    click element                       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/button
    wait until page contains element    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[2]  20
    click element                       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[2]
#    Close Browser

*** Test Cases ***

Open Deriv
    Login Deriv     ${my_email}     ${my_pw}


