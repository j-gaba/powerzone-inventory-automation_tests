*** Settings ***
Documentation   Robot file belonging to the Login Test Suite with test cases
...             for accessing inventory features for the Transaction Cashier Role
...
...             This set of tests was created using keywords from the SeleniumLibrary
Resource        resource.robot

*** Test Cases ***
[Transaction Cashier] Viewing Inventory Stock Information
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # should be open in log in page
    Login Page Should Be Open
    Wait Until Ajax Complete
    # input invalid username with any password
    Input Username  ${TC USERNAME}
    Input Password  ${VALID PASSWORD}
    Confirm Log In
    # should be open in home page
    Home Page Should Be Open

    # go to inventory page
    Click Image     ${INVENTORY BUTTON}
    # should be in inventory page
    Inventory Page Should Be Open
    Wait Until Ajax Complete
    # click on the more info button
    Click Element   xpath=${FIRST STOCK PATH}
    # should be in the page containing detailed information on the first stock
    More Info On Stock Page Should Be Open
    
    # close browser
    [Teardown]    Close Browser