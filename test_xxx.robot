*** Settings ***
Library    Collections
Library    String
*** Keywords ***
Get Apache Version
    [Return]        2_4_16
*** Variables ***
&{APACHE_DICT}    default_msg=XXXXXXXXX    2_4_16=ZZZZZZZZZ
*** Test Cases ***
TC1
    ${apache_version}=    Get Apache Version
    Log To Console    ${apache_version}

    ${err_msg}=    Catenate    ZZZZZZZZZ

    ${test_a}=    Get Variable Value    ${APACHE_DICT.${apache_version}}    ${APACHE_DICT.default_msg}
    Log To Console    ${APACHE_DICT.${apache_version}}    
    Log To Console    ${test_a}

    Should Match    ${test_a}    ${err_msg}