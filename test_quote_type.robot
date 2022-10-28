*** Settings ***
Library                SSHLibrary
Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${HOST}                172.20.107.89
${USERNAME}            root
${PASSWORD}            SIOS1234765

*** Test Cases ***
Execute Command And Verify Output
    ${makeConnectionScript}=  Catenate     /root/lk/make_ok_with_dolar.sql
    ${sleepScript}=        Catenate
    ...     SEPARATOR=\n
    ...     WAITFOR DELAY \\'00:05\\'
    ...     go

    Write To File
    ...     ${makeConnectionScript}
    ...     ${sleepScript}
    ...     >


*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}
Write To File
    [Documentation]     Write To File.
    [Arguments]         ${filePath}     ${content}  ${OPTION}=>>
    Execute Command
    ...     echo $'${content}' ${OPTION} ${filePath}

    Sleep       10s
