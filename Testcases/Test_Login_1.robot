*** Settings ***
Resource    ../PageObjects/LoginPage_With_ChromeDriver.robot
Test Setup    Open Demo Site
Test Teardown    Close Browser

*** Variables ***
${EMAIL}        test-email111@gmail.com
${PASSWD}       test-password111
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
