*** Settings ***
Documentation   Robot file belonging to the Login Test Suite with test cases
...             for accessing inventory features for the Inventory Manager Role
...
...             This set of tests was created using keywords from the SeleniumLibrary
Resource        resource.robot

*** Test Cases ***
[Inventory Manager] Viewing Inventory Stock Information
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # should be open in log in page
    Login Page Should Be Open
    Wait Until Ajax Complete
    # input invalid username with any password
    Input Username  ${IM USERNAME}
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
    
    # return to inventory page using go back button for next test case
    Click Element    //*[@class="btn btn-primary fw-bold float-start px-5 rounded-pill shadow-sm text-white"]
    
[Inventory Manager] Inputted Correct Inventory Details
    # should be in inventory page
    Inventory Page Should Be Open
    Wait Until Ajax Complete
    # click on the add stock button
    Click Element   //*[@class="btn btn-primary fw-bold float-end px-5 rounded-pill shadow-sm text-white"]
    # should be in add stock page
    Add Stock Page Should Be Open
    # input valid details
    Select Kerosene Name
    Click Element   add-stock-date-purchased
    Input Date  ${TEST DAY 2}  ${TEST MONTH 2}  ${TEST YEAR 2}
    Input Supplier  ${TEST SUPPLIER NAME 2}
    Input Location  ${TEST LOCATION 2}
    Input Quantity  ${TEST QUANTITY 2}
    Input Price  ${TEST PRICE 2}
    # confirm button should be enabled
    Wait Until Element Is Enabled   confirm-add-stock-btn
    Element Should Be Enabled   confirm-add-stock-btn
    # click on the confirm button
    Confirm Adding Stock
    Confirm Test Stock 2

[Inventory Manager] Price Has More than 2 Decimal Places
    # should be in inventory page
    Inventory Page Should Be Open
    Wait Until Ajax Complete
    # click on the add stock button
    Click Element   //*[@class="btn btn-primary fw-bold float-end px-5 rounded-pill shadow-sm text-white"]
    # should be in add stock page
    Add Stock Page Should Be Open
    # input valid details
    Select Kerosene Name
    Click Element   add-stock-date-purchased
    Input Date  ${TEST DAY 2}  ${TEST MONTH 2}  ${TEST YEAR 2}
    Input Supplier  ${TEST SUPPLIER NAME 2}
    Input Location  ${TEST LOCATION 2}
    Input Quantity  ${TEST QUANTITY 2}
    # input invalid price
    Input Price  ${INVALID PRICE}
    # click the confirm button
    Confirm Adding Stock
    # should still be in add stock page
    Add Stock Page Should Be Open

    # return to inventory page using cancel button for next test case
    Click Element    //*[@class="btn btn-primary fw-bold float-start px-5 rounded-pill shadow-sm text-white"]

[Inventory Manager] User Attempts to Type Wrong Data in Data Fields
    # should be in inventory page
    Inventory Page Should Be Open
    Wait Until Ajax Complete
    # click on the add stock button
    Click Element   //*[@class="btn btn-primary fw-bold float-end px-5 rounded-pill shadow-sm text-white"]
    # should be in add stock page
    Add Stock Page Should Be Open
    # input valid details for all fields except date
    Select Kerosene Name
    Input Supplier  ${TEST SUPPLIER NAME 2}
    Input Location  ${TEST LOCATION 2}
    Input Quantity  ${TEST QUANTITY 2}
    Input Price  ${TEST PRICE 2}
    Click Element   add-stock-date-purchased
    Input Date  ${INVALID DATA TYPE}  ${INVALID DATA TYPE}  ${INVALID DATA TYPE}
    # confirm button should still be disabled
    Element Should Be Disabled   confirm-add-stock-btn

    # input a valid date then an invalid quantity
    Click Element   add-stock-date-purchased
    Input Date  ${TEST DAY 2}  ${TEST MONTH 2}  ${TEST YEAR 2}
    Input Quantity  ${INVALID DATA TYPE}
    # confirm button should become disabled
    Wait Until Ajax Complete
    Element Should Be Disabled   confirm-add-stock-btn

    # input a valid quantity then an invalid price
    Input Quantity  ${TEST QUANTITY 2}
    Input Price  ${INVALID DATA TYPE}
    # confirm button should become disabled
    Wait Until Ajax Complete
    Element Should Be Disabled   confirm-add-stock-btn

    # return to inventory page using cancel button for next test case
    Click Element    //*[@class="btn btn-primary fw-bold float-start px-5 rounded-pill shadow-sm text-white"]

[Inventory Manager] Inputted Correct Inventory Edit Details
    # should be in inventory page
    Inventory Page Should Be Open
    Wait Until Ajax Complete
    # click on the edit stock button
    Click Element   xpath=${FIRST STOCK EDIT}
    # should be in edit stock page
    Edit Stock Page Should Be Open
    # input valid details
    Edit Diesel Name
    Click Element   edit-stock-date-purchased
    Edit Date  ${ORIG DAY}  ${ORIG MONTH}  ${ORIG YEAR}
    Edit Supplier  ${ORIG SUPPLIER NAME}
    Edit Location  ${ORIG LOCATION}
    Edit Quantity  ${ORIG QUANTITY}
    Edit Price  ${ORIG PRICE}
    # confirm button should be enabled
    Wait Until Element Is Enabled   confirm-edit-stock-btn
    Element Should Be Enabled   confirm-edit-stock-btn
    # click on the confirm button
    Confirm Editing Stock
    
    # should be in inventory page
    Inventory Page Should Be Open
    Wait Until Ajax Complete
    # click on the more info button
    Click Element   xpath=${FIRST STOCK PATH}
    # should be in the page containing detailed information on the first stock
    More Info On Stock Page Should Be Open
    # check if changes were made
    Confirm Edited Stock 2

    # return to inventory page using go back button for next test case
    Click Element    //*[@class="btn btn-primary fw-bold float-start px-5 rounded-pill shadow-sm text-white"]
    
[Inventory Manager] Edited Price Has More than 2 Decimal Places
    # should be in inventory page
    Inventory Page Should Be Open
    Wait Until Ajax Complete
    # click on the edit stock button
    Click Element   xpath=${FIRST STOCK EDIT}
    # should be in edit stock page
    Edit Stock Page Should Be Open
    # input valid details
    Edit Kerosene Name
    Click Element   edit-stock-date-purchased
    Edit Date  ${NEW DAY}  ${NEW MONTH}  ${NEW YEAR}
    Edit Supplier  ${NEW SUPPLIER NAME}
    Edit Location  ${NEW LOCATION}
    Edit Quantity  ${NEW QUANTITY}
    # input invalid price
    Edit Price  ${INVALID PRICE}
    # click the confirm button
    Confirm Editing Stock
    # should still be in add stock page
    Edit Stock Page Should Be Open

    # return to inventory page using cancel button for next test case
    Click Element    //*[@class="btn btn-primary fw-bold float-start px-5 rounded-pill shadow-sm text-white"]

[Inventory Manager] User Attempts to Type Wrong Data to Edit Data Fields
    # should be in inventory page
    Inventory Page Should Be Open
    Wait Until Ajax Complete
    # click on the edit stock button
    Click Element   xpath=${FIRST STOCK EDIT}
    # should be in edit stock page
    Edit Stock Page Should Be Open
    # input valid details for all fields except quantity
    Edit Kerosene Name
    Edit Supplier  ${NEW SUPPLIER NAME}
    Edit Location  ${NEW LOCATION}
    Edit Quantity  ${NEW QUANTITY}
    Edit Price  ${NEW PRICE}
    Click Element   edit-stock-date-purchased
    Edit Date  ${NEW DAY}  ${NEW MONTH}  ${NEW YEAR}
    Edit Quantity  ${INVALID DATA TYPE}
    # confirm button should become disabled
    Wait Until Ajax Complete
    Element Should Be Disabled   confirm-edit-stock-btn

    # input a valid quantity then an invalid price
    Edit Quantity  ${NEW QUANTITY}
    Edit Price  ${INVALID DATA TYPE}
    # confirm button should become disabled
    Wait Until Ajax Complete
    Element Should Be Disabled   confirm-edit-stock-btn

    # return to inventory page using cancel button for next test case
    Click Element    //*[@class="btn btn-primary fw-bold float-start px-5 rounded-pill shadow-sm text-white"]

    # close browser
    [Teardown]    Close Browser