*** Settings ***
Documentation  To validate the Login form
Library  SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${Error_Message_Login}     xpath://form[@id='login-form']/div[1]


*** Test Cases ***
Validate Unsuccesful Login
    Open the browser with mortage payment url
    Fill the login form
    Wait until it checks and display error page
    Verify if error message is correct


*** Keywords ***
Open the browser with mortage payment url
    create webdriver    Chrome  executable_path=C:/Users/Amit/Drivers/chromedriver
    go to   https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    input text      id:username     rahulshettyacademy
    input password      id:password     123456
    click button    id:signInBtn

Wait until it checks and display error page
    wait until element is visible   ${Error_Message_Login}

Verify if error message is correct
    #${result}=  get text    ${Error_Message_Login}
    #Should Be Equal As Strings  ${result}   Incorrect username/password.
    element text should be      ${Error_Message_Login}      Incorrect username/password.
