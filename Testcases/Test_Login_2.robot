*** Settings ***
Resource    ../PageObjects/LoginPage.robot
Test Setup    Open Demo Site
Test Teardown    Close Browser

*** Variables ***
${EMAIL}        test-email222@gmail.com
${PASSWD}       test-password222
${ERR}          error

*** Test Cases ***
Login With Wrong Password
    Click SignIn Button
    Enter Email        ${EMAIL}
    Enter Password     ${PASSWD}
    Click Login Button
    Verify Error Message    ${ERR}

Login Without Password
    Click SignIn Button
    Enter Email        ${EMAIL}
    Click Login Button
    Verify Error Message    ${ERR}
