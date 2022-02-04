*** Settings ***
Documentation   Robot file belonging to the Transaction Access Suite with test cases
...             for accessing delivery features for the Inventory Manager Role
...
...             This set of tests was created using keywords from the SeleniumLibrary
Resource        resource.robot

*** Test Cases ***
[Administrator] Viewing Transaction Information
    Open Transactions Page as Administrator

    # click on more info to access extra details
    Click Element   xpath=${FIRST TRANSACTION PATH}

    # should be in the page containing detailed information on the first delivery
    More Info On Transactions Page Should Be Open

    # close browser
    [Teardown]    Close Browser

[Administrator] Inputted Correct Transaction Details - Add
    Open Add Transactions Page as Administrator
    Input Name    Petron
    Input Number  09175442636
    Input Date    01    01    2022
    Input Quantity    ${VALID GASOLINE}   ${VALID P95}    ${VALID DIESEL}   ${VALID P97}    ${VALID KEROSENE}
    Wait Until Element Is Enabled   confirm-add-transaction-btn
    Element Should Be Enabled   confirm-add-transaction-btn
    Confirm Transaction

    Transactions Page Should Be Open
    Wait Until Ajax Complete

    Page Should Contain   01/01/2022
    Page Should Contain   Petron

    [Teardown]    Close Browser

[Administrator] Fuel Quantity is Above Limit - Add
    Open Add Transactions Page as Administrator
    Input Name    Caltex
    Input Number  09936658524
    Input Date    02    03    2022
    Input Quantity    ${INVALID GASOLINE}   ${INVALID P95}    ${INVALID DIESEL}   ${INVALID P97}    ${INVALID KEROSENE}
    Element Should Be Disabled   confirm-add-transaction-btn

    [Teardown]    Close Browser

[Administrator] Phone Number is not 10 digits - Add
    Open Add Transactions Page as Administrator
    Input Name    Caltron
    Input Number  03
    Input Date    01    12    2022
    Input Quantity    ${VALID GASOLINE}   ${VALID P95}    ${VALID DIESEL}   ${VALID P97}    ${VALID KEROSENE}
    Page Should Contain   Invalid phone number (should have 7 to 15 digits) 
    [Teardown]    Close Browser

[Administrator] User attempts to Input incorrect data - Add
    Open Add Transactions Page as Administrator
    Input Name    Caltron
    Input Number  abc
    Input Date    01    12    2022
    Input Quantity    abc  abc    abc   abc    abc
    Check Fields For Content
    [Teardown]    Close Browser

[Administrator] Inputted Correct Transaction Details - Edit
    Edit Second Transaction as Administrator
    Input Name Edit    Palshell
    Input Number Edit  09175548663
    Input Date Edit    15   03    2022
    Input Quantity Edit    ${VALID GASOLINE}   ${VALID P95}    ${VALID DIESEL}   ${VALID P97}    ${VALID KEROSENE}
    Wait Until Element Is Enabled   confirm-edit-transaction-btn
    Element Should Be Enabled   confirm-edit-transaction-btn
    Confirm Transaction Edit

    Transactions Page Should Be Open
    Wait Until Ajax Complete

    Page Should Contain   03/15/2022
    Page Should Contain   Palshell

    [Teardown]    Close Browser

[Administrator] Fuel Quantity is Above Limit - Edit
    Edit Second Transaction as Administrator
    Input Name Edit    Roulx Kard
    Input Number Edit  09936658524
    Input Date Edit    02    03    2022
    Input Quantity Edit    ${INVALID GASOLINE}   ${INVALID P95}    ${INVALID DIESEL}   ${INVALID P97}    ${INVALID KEROSENE}
    Element Should Be Disabled   confirm-edit-transaction-btn

    [Teardown]    Close Browser

[Administrator] Phone Number is not 10 digits - Edit
    Edit Second Transaction as Administrator
    Input Name Edit    Caltron
    Input Number Edit  03
    Input Date Edit    01    12    2022
    Input Quantity Edit    ${VALID GASOLINE}   ${VALID P95}    ${VALID DIESEL}   ${VALID P97}    ${VALID KEROSENE}
    Page Should Contain   Invalid phone number (should have 7 to 15 digits) 
    [Teardown]    Close Browser

[Administrator] User attempts to input incorrect data - Edit
    Edit Second Transaction as Administrator
    Input Name Edit    Caltron
    Input Number Edit  abc
    Input Date Edit    01    12    2022
    Input Quantity Edit    abc  abc    abc   abc    abc
    Check Fields For Content Edit
    [Teardown]    Close Browser