*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}              http://automationpractice.com/index.php
${browser}          headlesschrome
${btnSignIn}        xpath=//a[contains(text(),'Sign in')]
${txbEmail}         id=email
${txbPassword}      id=passwd
${btnLogin}         xpath=//body[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/form[1]/div[1]/p[2]/button[1]/span[1]
${lbError}          xpath=//p[contains(text(),'There is 1 error')]

*** Keywords ***
Open Demo Site
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Click SignIn Button
    Sleep    5
    Click Element    ${btnSignIn}

Enter Email
    [Arguments]    ${username}
    Input Text    ${txbEmail}    ${username}

Enter Password
    [Arguments]    ${passwd}
    Input Text    ${txbPassword}    ${passwd}

Click Login Button
    Click Element    ${btnLogin}

Verify Error Message
    [Arguments]    ${err}
    Wait Until Element Is Visible    ${lbError}
    Element Should Contain           ${lbError}        ${err}