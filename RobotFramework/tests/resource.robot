*** Settings ***
Documentation  A resource file with reusable keywords and variables.
Library  SeleniumLibrary

*** Variables ***
${user_name}        rahulshettyacademy
${invalid_password}     123456
${valid_password}       learning
${url}      https://rahulshettyacademy.com/loginpagePractise/



*** Keywords ***
Open the browser with mortage payment url
    create webdriver    Chrome  executable_path=C:/Users/Amit/Drivers/chromedriver
    go to   ${url}
    Maximize Browser Window


Close browser session
    Close Browser
