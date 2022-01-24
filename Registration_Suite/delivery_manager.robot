*** Settings ***
Documentation   Robot file belonging to the Registration Test Suite with test cases
...             for valid and invalid registrations for the Delivery Manager Role
...
...             This set of tests was created using keywords from the SeleniumLibrary
Resource        resource.robot

*** Test Cases ***
[Delivery Manager] Email Already Taken
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete
    # choose DM role
    Select Delivery Manager Role
    # input valid details
    Input First Name  ${DM FIRST NAME}
    Input Last Name  ${DM LAST NAME}
    Input Username  ${DM USERNAME}
    Input Password  ${VALID PASSWORD}
    Input Confirm Password  ${VALID PASSWORD}
    # input a taken email
    Input Email     ${EXISTING EMAIL}
    # Error message is "Email has been taken"
    Wait Until Element Is Visible   invalid-unique-email
    Element Text Should Be    invalid-unique-email    Email has been taken
    # close browser
    [Teardown]    Close Browser

    #invalid-blank-email

[Delivery Manager] Username Already Taken
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete
    # choose DM role
    Select Delivery Manager Role
    # input valid details
    Input Email  ${DM EMAIL}
    Input First Name  ${DM FIRST NAME}
    Input Last Name  ${DM LAST NAME}
    Input Password  ${VALID PASSWORD}
    Input Confirm Password  ${VALID PASSWORD}
    # input a taken username
    Input Username     ${EXISTING USERNAME}
    # Error message is "Username has been taken"
    Wait Until Element Is Visible   invalid-unique-username
    Element Text Should Be    invalid-unique-username    Username has been taken
    # close browser
    [Teardown]    Close Browser

[Delivery Manager] Username Does Not Follow the Specified String Format
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Delivery Manager Role
    # input valid details
    Input Email  ${DM EMAIL}
    Input First Name  ${DM FIRST NAME}
    Input Last Name  ${DM LAST NAME}
    Input Password  ${VALID PASSWORD}
    Input Confirm Password  ${VALID PASSWORD}

    # input space as username
    Input Username     ${EMPTY USERNAME}
    # Error message is "Kindly input a username"
    Element Text Should Be    invalid-blank-username    Kindly input a username

    # input special characters as username
    Input Username     ${INVALID USERNAME}
    # Error message is "Username should not consist of special characters only"
    Wait Until Element Is Visible   invalid-char-username
    Element Text Should Be    invalid-char-username    Username should not consist of special characters only
    # close browser
    [Teardown]    Close Browser

[Delivery Manager] Password Does Not Follow the Specified String Length
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Delivery Manager Role
    # input valid details
    Input Email  ${DM EMAIL}
    Input First Name  ${DM FIRST NAME}
    Input Last Name  ${DM LAST NAME}
    Input Username  ${DM USERNAME}
    
    # input a password with less than 12 characters
    Input Password  ${SHORT PASSWORD}
    # Error message is "Should have at least 12 characters"
    Wait Until Element Is Visible   invalid-length-password
    Element Text Should Be    invalid-length-password    Should have at least 12 characters

    # close browser
    [Teardown]    Close Browser

[Delivery Manager] Password Does Not Follow the Specified String Format
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Delivery Manager Role
    # input valid details
    Input Email  ${DM EMAIL}
    Input First Name  ${DM FIRST NAME}
    Input Last Name  ${DM LAST NAME}
    Input Username  ${DM USERNAME}
    
    # input an invalid password
    Input Password  ${INVALID PASSWORD}
    # Error message is "Should contain lowercase and uppercase letters, numbers, and punctuations"
    Wait Until Element Is Visible   invalid-char-password
    Element Text Should Be    invalid-char-password    Should contain lowercase and uppercase letters, numbers, and punctuations

    # close browser
    [Teardown]    Close Browser

[Delivery Manager] Password Does Not Match Confirm Password
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Delivery Manager Role
    # input valid details
    Input Email  ${DM EMAIL}
    Input First Name  ${DM FIRST NAME}
    Input Last Name  ${DM LAST NAME}
    Input Username  ${DM USERNAME}
    Input Password  ${VALID PASSWORD}

    # input an invalid password
    Input Confirm Password  ${INVALID PASSWORD}
    # Error message is "Passwords do not match"
    Wait Until Element Is Visible   invalid-confirm-password
    Element Text Should Be    invalid-confirm-password    Passwords do not match

    # close browser
    [Teardown]    Close Browser

[Delivery Manager] Valid Registration
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # click sign up button
    Go To Sign Up
    # should be open in sign up page
    Sign Up Page Should Be Open
    Wait Until AjaxComplete

    # choose DM role
    Select Delivery Manager Role
    # input valid details
    Input Email  ${DM EMAIL}
    Input First Name  ${DM FIRST NAME}
    Input Last Name  ${DM LAST NAME}
    Input Username  ${DM USERNAME}
    Input Password  ${VALID PASSWORD}
    Input Confirm Password  ${VALID PASSWORD}
    
    # click signup button
    Confirm Sign Up
    # should be open in success page
    Success Page Should Be Open

    # close browser
    [Teardown]    Close Browser