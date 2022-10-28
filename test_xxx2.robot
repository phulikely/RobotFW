*** Settings ***
Library    String
*** Keywords ***
Get Apache Version
    [Return]        APACHE_2_4_16
*** Variables ***
&{APACHE_MSG}
...     DEFAULT=DocumentRoot is not a directory, or is not readable
...     APACHE_2_4_16=DocumentRoot must be a directory
*** Test Cases ***
TC1
    ${APACHE_VERSION}=    Get Apache Version
    Log To Console        ${APACHE_VERSION}
    ${err_msg}=            Catenate                        DocumentRoot must be a directory
    ${msg}=                 Get Variable Value             ${APACHE_MSG.${APACHE_VERSION}}         ${APACHE_MSG.DEFAULT}
    Log To Console         ${APACHE_MSG.${APACHE_VERSION}}
    Log To Console         ${msg}

    Should Match           ${err_msg}                        ${msg}