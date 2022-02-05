*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...             Creating system specific keywords from default keywords
...             from SeleniumLibrary
Library         SeleniumLibrary

*** Variables ***
${SERVER}               localhost:3000
${BROWSER}              chrome
${DELAY}                0.1
${LOGIN URL}            http://${SERVER}/
${IS AJAX COMPLETE}     ${EMPTY}

${FIRST DELIVERY PATH}         /html/body/div[3]/div/div[2]/div/div/table/tbody/tr/td[6]/a/img
${FIRST DELIVERY EDIT PATH}    /html/body/div[3]/div/div[2]/div/div/table/tbody/tr/td[7]/a/img

${INVALID USER}         powerzone
${INVALID PASSWORD}     Password1234
${VALID PASSWORD}       Password123!

${IM USERNAME}          inventory_manager
${DM USERNAME}          delivery_manager
${TC USERNAME}          transaction_cashier

${ADMIN USERNAME}       powerzoneadmin
${ADMIN PASSWORD}       password123

${DELIVERIES BUTTON}    /assets/fast.png
${TRANSACTIONS BUTTON}  /assets/transaction.png
${INVENTORY BUTTON}     /assets/inventory.png

${TEST DATE MONTH}      02
${TEST DATE DAY}        01
${TEST DATE YEAR}       2022

${VALID GASOLINE}       1
${VALID P95}            1
${VALID DIESEL}         1
${VALID P97}            1
${VALID KEROSENE}       1

${INVALID GASOLINE}       99999
${INVALID P95}            99999
${INVALID DIESEL}         99999
${INVALID P97}            99999
${INVALID KEROSENE}       99999


*** Keywords ***
Go to Home
    Click Element   //*[@href="/getHome"]

Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element    login-btn

Input Username
    [Arguments]    ${username}
    Input Text    login-username    ${username}

Input Password
    [Arguments]    ${pass}
    Input Text    login-password    ${pass}

Confirm Log In
    Click Button    login-btn

Home Page Should Be Open
    Page Should Contain Image     ${DELIVERIES BUTTON} 
    Page Should Contain Image     ${TRANSACTIONS BUTTON}
    Page Should Contain Image     ${INVENTORY BUTTON}

Deliveries Page Should Be Open
    Wait Until Ajax Complete
    Page Should Contain     DELIVERIES

More Info On Deliveries Page Should Be Open
    Page Should Contain     Delivery ID
    Page Should Contain     Status
    Page Should Contain     Customer Name
    Page Should Contain     Customer Phone Number
    Page Should Contain     Delivery Date
    Page Should Contain     Warehouse Location
    Page Should Contain     Drop-Off Location
    Page Should Contain     Delivery Manager
    Page Should Contain     Driver

Wait Until Ajax Complete
    FOR    ${INDEX}    IN RANGE    1    100000
        ${IS AJAX COMPLETE}    Execute JavaScript    return window.jQuery!=undefined && jQuery.active==0
        Log     ${INDEX}
        Log     ${IS AJAX COMPLETE}
        Run Keyword If      ${IS AJAX COMPLETE}==True    Exit For Loop
    END

Open Deliveries Page as Transaction Cashier
    Open Browser To Login Page
    Login Page Should Be Open
    Wait Until Ajax Complete
    Input Username  ${TC USERNAME}
    Input Password  ${VALID PASSWORD}
    Confirm Log In
    Wait Until Ajax Complete
    Home Page Should Be Open
    Click Image   ${DELIVERIES BUTTON}
    Deliveries Page Should Be Open
    Wait Until Ajax Complete

Open Deliveries Page as Administrator
    Open Browser To Login Page
    Login Page Should Be Open
    Wait Until Ajax Complete
    Input Username  ${ADMIN USERNAME}
    Input Password  ${ADMIN PASSWORD}
    Confirm Log In
    Home Page Should Be Open
    Click Image   ${DELIVERIES BUTTON}
    Deliveries Page Should Be Open
    Wait Until Ajax Complete

Open Deliveries Page as Inventory Manager
    Open Browser To Login Page
    Login Page Should Be Open
    Wait Until Ajax Complete
    Input Username  ${IM USERNAME}
    Input Password  ${VALID PASSWORD}
    Confirm Log In
    Home Page Should Be Open
    Click Image   ${DELIVERIES BUTTON}
    Deliveries Page Should Be Open
    Wait Until Ajax Complete

Open Deliveries Page as Delivery Manager
    Open Browser To Login Page
    Login Page Should Be Open
    Wait Until Ajax Complete
    Input Username  ${DM USERNAME}
    Input Password  ${VALID PASSWORD}
    Confirm Log In
    Home Page Should Be Open
    Click Image   ${DELIVERIES BUTTON}
    Deliveries Page Should Be Open
    Wait Until Ajax Complete

Edit Deliveries Page Should Be Open
    Wait Until Ajax Complete
    Page Should Contain   EDIT DELIVERY

Open Edit Deliveries Page as Delivery Manager
    Open Deliveries Page as Delivery Manager
    Click Element   xpath=${FIRST DELIVERY EDIT PATH}
    Edit Deliveries Page Should Be Open
    Wait Until Ajax Complete

Edit First Delivery As Administrator
    Open Deliveries Page as Administrator
    Click Element   xpath=${FIRST DELIVERY EDIT PATH}
    Edit Deliveries Page Should Be Open
    Wait Until Ajax Complete


Input Name Edit
    [Arguments]   ${name}
    Input Text    edit-delivery-customer-name   ${name}

Input Number Edit
    [Arguments]   ${number}
    Input Text    edit-delivery-customer-number   ${number}

Input Warehouse Edit
    [Arguments]   ${warehouse}
    Input Text    edit-delivery-warehouse   ${warehouse}

Input Drop-Off Edit
    [Arguments]   ${dropoff}
    Input Text    edit-delivery-dropoff   ${dropoff}

Input Delivery Manager Edit
    [Arguments]   ${dm}
    Input Text    edit-delivery-manager   ${dm}

Input Driver Edit
    [Arguments]   ${driver}
    Input Text    edit-delivery-driver   ${driver}

Input Date Edit
    [Arguments]   ${day}    ${month}    ${year}
    Press Keys    edit-delivery-date    ${day}    ${month}    ${year}

Confirm Delivery Edit
    Click Element   confirm-edit-delivery-btn

Check Fields for Content Edit
    Element Text Should Be    edit-delivery-customer-number   \

Input Name
    [Arguments]   ${name}
    Input Text    add-transaction-customer-name   ${name}

Input Number
    [Arguments]   ${number}
    Input Text    add-transaction-customer-number   ${number}

Input Date
    [Arguments]   ${month}    ${day}    ${year}
    Press Keys    add-transaction-date    ${month}    ${day}    ${year}

Input Quantity
    [Arguments]   ${gasoline}   ${p95}    ${diesel}   ${p97}    ${kerosene}
    Input Text    add-transaction-gasoline-liters   ${gasoline}
    Input Text    add-transaction-premium-gasoline-95-liters    ${p95}
    Input Text    add-transaction-diesel-liters   ${diesel}
    Input Text    add-transaction-premium-gasoline-97-liters    ${p97}
    Input Text    add-transaction-kerosene-liters   ${kerosene}

Confirm Transaction
    Click Element   confirm-add-transaction-btn

Transactions Page Should Be Open
    Wait Until Ajax Complete
    Page Should Contain     TRANSACTIONS

Open Add Transactions Page as Administrator
    Open Transactions Page as Administrator
    Click Element   //*[@href="/getAddTransaction"]
    Add Transactions Page Should Be Open
    Wait Until Ajax Complete

Open Transactions Page as Administrator
    Open Browser To Login Page
    Login Page Should Be Open
    Wait Until Ajax Complete
    Input Username  ${ADMIN USERNAME}
    Input Password  ${ADMIN PASSWORD}
    Confirm Log In
    Home Page Should Be Open
    Click Image   ${TRANSACTIONS BUTTON}
    Transactions Page Should Be Open
    Wait Until Ajax Complete

Add Transactions Page Should Be Open
    Wait Until Ajax Complete
    Page Should Contain   ADD TRANSACTION