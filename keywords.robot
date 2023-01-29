*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${urlDownloas}    https://www.playchallenger.com/download/
${urlLogin}       https://my.playchallenger.com/login
${title}  Download Windows Application | Challenger
${locatorLoginField}    name=email
${locatorPasswodField}    name=password
${locatorButtonForm}    xpath=//form[contains(.,'Username *personUsername *Password *vpn_keyPassword *Login')]
${buttomCookies}    id=CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll
${locatorWCredencial}    xpath=//div[@class='MuiPaper-root MuiSnackbarContent-root jss29 jss32 jss35 MuiPaper-elevation6'][contains(.,'error_outlineUnable to login with provided credentials.close')]
${a}    //p[@class='MuiTypography-root jss34 MuiTypography-body1'][contains(.,'Unable to login with provided credentials.')]
${textLocatorWCredencial}    Unable to login with provided credentials.
${login}    12345
${password}    123456


*** Keywords ***
abrir navegador
    Open Browser    browser=chrome

Acessar a aba Downloads
    Go To    url=${urlDownloas}

Check tTitle page
    Title Should Be    ${title}

Access Login Tab
    Go To    ${urlLogin}

Check and Aceept Cookies
    wait Until Element Is Enabled    ${buttomCookies}
    Click Button    ${buttomCookies}

Input Login, Password and Submit Form
    Input Text                       ${locatorLoginField}    ${login}
    Input Password                   ${locatorPasswodField}  ${password}
    wait Until Element Is Enabled    ${locatorButtonForm}
    Submit Form                      ${locatorButtonForm}

Checks the credentials error message
    Wait Until Element Is Visible    ${locatorWCredencial}
    Element Text Should Be           ${a}    ${textLocatorWCredencial}
    