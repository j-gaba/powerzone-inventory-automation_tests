*** Settings ***
Documentation   Robot file belonging to the Transaction Access Suite with test cases
...             for accessing delivery features for the Delivery Manager Role
...
...             This set of tests was created using keywords from the SeleniumLibrary
Resource        resource.robot

*** Test Cases ***
[Delivery Manager] Viewing Transaction Information
    Open Deliveries Page as Delivery Manager

    # click on more info to access extra details
    Click Element   xpath=${FIRST DELIVERY PATH}

    # should be in the page containing detailed information on the first delivery
    More Info On Deliveries Page Should Be Open

    # close browser
    [Teardown]    Close Browser

[Administrator] Inputted Correct Delivery Details - Edit
    Edit First Delivery As Administrator
    Input Name Edit   Caltron
    Input Number Edit   09565522369
    Input Date Edit   25   02    2022
    Input Warehouse Edit    TheOneThat 560, Ina St.
    Input Drop-Off Edit  In SomeOtherLife St.
    Input Delivery Manager Edit  Mr. MD
    Input Driver Edit  Daht Ruc Drie Berr
    Wait Until Element Is Enabled   confirm-edit-delivery-btn
    Element Should Be Enabled   confirm-edit-delivery-btn
    Confirm Delivery Edit

    Deliveries Page Should Be Open
    Wait Until Ajax Complete

    Page Should Contain   02/25/2022
    Page Should Contain   Caltron
    Page Should Contain   In SomeOtherLife St.

    [Teardown]    Close Browser

[Administrator] Phone Number is not 10 digits - Edit
    Edit First Delivery As Administrator
    Input Name Edit   Caltron
    Input Number Edit   23
    Input Date Edit   25   02    2022
    Input Warehouse Edit    TheOneThat 560, Ina St.
    Input Drop-Off Edit  In SomeOtherLife St.
    Input Delivery Manager Edit  Mr. MD
    Input Driver Edit  Daht Ruc Drie Berr
    Page Should Contain   Invalid phone number (should have 7 to 15 digits) 
    [Teardown]    Close Browser

[Administrator] User attempts to input incorrect data - Edit
    Edit First Delivery As Administrator
    Input Name Edit   Caltron
    Input Number Edit   abc
    Input Date Edit   de   fg    hijk
    Input Warehouse Edit    TheOneThat 560, Ina St.
    Input Drop-Off Edit  In SomeOtherLife St.
    Input Delivery Manager Edit  Mr. MD
    Input Driver Edit  Daht Ruc Drie Berr
    Check Fields For Content Edit
    [Teardown]    Close Browser