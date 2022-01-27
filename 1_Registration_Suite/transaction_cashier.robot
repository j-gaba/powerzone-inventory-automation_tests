*** Settings ***
Documentation   Robot file belonging to the Registration Test Suite with test cases
...             for valid and invalid registrations for the Transaction Cashier Role
...
...             This set of tests was created using keywords from the SeleniumLibrary
Resource        resource.robot

*** Test Cases ***
[Transaction Cashier] Email Already Taken
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete
    # choose DM role
    Select Transaction Cashier Role
    # input valid details
    Input First Name  ${TC FIRST NAME}
    Input Last Name  ${TC LAST NAME}
    Input Username  ${TC USERNAME}
    Input Password  ${VALID PASSWORD}
    Input Confirm Password  ${VALID PASSWORD}
    # input a taken email
    Input Email     ${EXISTING EMAIL}
    Click Element   signup-fname
    # Error message is "Email has been taken"
    Wait Until Element Is Visible   invalid-unique-email
    Element Text Should Be    invalid-unique-email    Email has been taken
    # close browser
    [Teardown]    Close Browser

    #invalid-blank-email

[Transaction Cashier] Username Already Taken
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete
    # choose DM role
    Select Transaction Cashier Role
    # input valid details
    Input Email  ${TC EMAIL}
    Input First Name  ${TC FIRST NAME}
    Input Last Name  ${TC LAST NAME}
    Input Password  ${VALID PASSWORD}
    Input Confirm Password  ${VALID PASSWORD}
    # input a taken username
    Input Username     ${EXISTING USERNAME}
    Click Element   signup-fname
    # Error message is "Username has been taken"
    Wait Until Element Is Visible   invalid-unique-username
    Element Text Should Be    invalid-unique-username    Username has been taken
    # close browser
    [Teardown]    Close Browser

[Transaction Cashier] Username Does Not Follow the Specified String Format
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Transaction Cashier Role
    # input valid details
    Input Email  ${TC EMAIL}
    Input First Name  ${TC FIRST NAME}
    Input Last Name  ${TC LAST NAME}
    Input Password  ${VALID PASSWORD}
    Input Confirm Password  ${VALID PASSWORD}

    # input space as username
    Input Username     ${EMPTY USERNAME}
    Click Element   signup-fname
    # Error message is "Kindly input a username"
    Wait Until Element Is Visible   invalid-blank-username
    Element Text Should Be    invalid-blank-username    Kindly input a username

    # input special characters as username
    Input Username     ${INVALID USERNAME}
    Click Element   signup-fname
    # Error message is "Username should not consist of special characters only"
    Wait Until Element Is Visible   invalid-char-username
    Element Text Should Be    invalid-char-username    Username should not consist of special characters only
    # close browser
    [Teardown]    Close Browser

[Transaction Cashier] Password Does Not Follow the Specified String Length
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Transaction Cashier Role
    # input valid details
    Input Email  ${TC EMAIL}
    Input First Name  ${TC FIRST NAME}
    Input Last Name  ${TC LAST NAME}
    Input Username  ${TC USERNAME}
    
    # input a password with less than 12 characters
    Input Password  ${SHORT PASSWORD}
    Click Element   signup-fname
    # Error message is "Should have at least 12 characters"
    Wait Until Element Is Visible   invalid-length-password
    Element Text Should Be    invalid-length-password    Should have at least 12 characters

    # close browser
    [Teardown]    Close Browser

[Transaction Cashier] Password Does Not Follow the Specified String Format
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Transaction Cashier Role
    # input valid details
    Input Email  ${TC EMAIL}
    Input First Name  ${TC FIRST NAME}
    Input Last Name  ${TC LAST NAME}
    Input Username  ${TC USERNAME}
    
    # input an invalid password
    Input Password  ${INVALID PASSWORD}
    Click Element   signup-fname
    # Error message is "Should contain lowercase and uppercase letters, numbers, and punctuations"
    Wait Until Element Is Visible   invalid-char-password
    Element Text Should Be    invalid-char-password    Should contain lowercase and uppercase letters, numbers, and punctuations

    # close browser
    [Teardown]    Close Browser

[Transaction Cashier] Password Does Not Match Confirm Password
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Transaction Cashier Role
    # input valid details
    Input Email  ${TC EMAIL}
    Input First Name  ${TC FIRST NAME}
    Input Last Name  ${TC LAST NAME}
    Input Username  ${TC USERNAME}
    Input Password  ${VALID PASSWORD}

    # input an invalid password
    Input Confirm Password  ${INVALID PASSWORD}
    Click Element   signup-fname
    # Error message is "Passwords do not match"
    Wait Until Element Is Visible   invalid-confirm-password
    Element Text Should Be    invalid-confirm-password    Passwords do not match

    # close browser
    [Teardown]    Close Browser

[Transaction Cashier] Valid Registration
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Transaction Cashier Role
    # input valid details
    Input Email  ${TC EMAIL}
    Input First Name  ${TC FIRST NAME}
    Input Last Name  ${TC LAST NAME}
    Input Username  ${TC USERNAME}
    Input Password  ${VALID PASSWORD}
    Input Confirm Password  ${VALID PASSWORD}
    Click Element   signup-fname
    
    # click signup button
    Confirm Sign Up
    # should be open in success page
    Wait Until Page Contains    Kindly wait for the admin to validate the application.
    Success Page Should Be Open

    # close browser
    [Teardown]    Close Browser