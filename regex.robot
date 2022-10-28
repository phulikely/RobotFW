*** Settings ***
Library    String
*** Variables ***
# ${a}    Server version: Apache/2.4.16 (Linux/SUSE)\nServer built:   2015-11-05 08:39:36.000000000 +0000

# ${b}   (\\d+\\.\\d+\\.\\d+)

*** Keywords ***
*** Test Cases ***
TC1
    ${a}=    Catenate    Server version: x.y.z abc 5.6.7 123 Apache/2.4.16 (Linux/SUSE)\nServer built:   2015-11-05 08:39:36.000000000 +0000
    ${a1}=    Catenate    MC-Baaaad_2.3.4.5.777 ehehe MU-Haaland_1.2.33.567 (Linux/SUSE)\nServer built:   2015-11-05 08:39:36.000000000 +0000

    # ${b}=    Catenate   (\\d+\\.\\d+\\.\\d+)
    ${c}=    Catenate    d_((\\d+\\.*)+)

    ${apache_version}=      Get Regexp Matches
    ...     ${a1}
    # ...     ${b}
    ...     ${c}
    ...    2

    ${result} =    Replace String    ${apache_version}[0]    .    _

    # ${final_apache_version}=  Catenate  ${apache_version}[0]_${apache_version}[1]_${apache_version}[2]

    Log To Console   ${apache_version}
    # Log To Console   ${final_apache_version}
    Log To Console   ${result}