*** Settings ***
Library    SeleniumLibrary
Library    ../Resources/Driver_Manager.py
Library    ../venv/lib/site-packages/robot/libraries/Screenshot.py

*** Variables ***
${url}              http://automationpractice.com/index.php
#${browser}          headlesschrome
${browser}          chrome
${btnSignIn}        xpath=//a[contains(text(),'Sign in')]
${txbEmail}         id=email
${txbPassword}      id=passwd
${btnLogin}         xpath=//body[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/form[1]/div[1]/p[2]/button[1]/span[1]
${lbError}          xpath=//p[contains(text(),'There is 1 error')]

*** Keywords ***
Open Demo Site
    ${driver_path}=    Driver_Manager.Get Driver Path With Browser    ${browser}
    Open Browser    ${url}    ${browser}    executable_path=${driver_path}
    Maximize Browser Window

Click SignIn Button
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