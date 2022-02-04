*** Settings ***
Documentation   Robot file belonging to the Transaction Access Suite with test cases
...             for accessing delivery features for the Transaction Cashier Role
...
...             This set of tests was created using keywords from the SeleniumLibrary
Resource        resource.robot

*** Test Cases ***
[Transaction Cashier] Viewing Transaction Information
    Open Deliveries Page as Transaction Cashier

    # click on more info to access extra details
    Click Element   xpath=${FIRST DELIVERY PATH}

    # should be in the page containing detailed information on the first delivery
    More Info On Deliveries Page Should Be Open

    # close browser
    [Teardown]    Close Browser