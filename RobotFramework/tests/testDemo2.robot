*** Settings ***
Documentation  To validate the Login form
Library  SeleniumLibrary
Library  Collections
Test Setup      Open the browser with mortage payment url
Test Teardown   Close browser session
Resource        resource.robot



*** Variables ***
${Error_Message_Login}     xpath://form[@id='login-form']/div[1]
${shop_page_load}          css:.nav-link


*** Test Cases ***
#Validate Unsuccesful Login
    #Open the browser with mortage payment url
#    Fill the login form         ${user_name}        ${invalid_password}
#    Wait untill element is located on the page      ${Error_Message_Login}
#    Verify if error message is correct


Validate cards displayed in the shopping page
    Fill the login form         ${user_name}        ${valid_password}
    Wait untill element is located on the page      ${shop_page_load}
    Verify card titles in the shop page
    Select the card     Blackberry
    Validate the checkout count

Select the form and navigate to child window
    Fill the login details and select the user option




*** Keywords ***
#Open the browser with mortage payment url
    #create webdriver    Chrome  executable_path=C:/Users/Amit/Drivers/chromedriver
    #go to   ${url}

Fill the login form
    [arguments]     ${username}     ${password}
    input text      id:username     ${username}
    input password      id:password     ${password}
    click button    id:signInBtn


Wait untill element is located on the page
    [arguments]     ${element}
    wait until element is visible       ${element}

Verify if error message is correct
    #${result}=  get text    ${Error_Message_Login}
    #Should Be Equal As Strings  ${result}   Incorrect username/password.
    element text should be      ${Error_Message_Login}      Incorrect username/password.

Verify card titles in the shop page
    @{expectedList} =       Create List     iphone X	Samsung Note 8		Nokia Edge 		Blackberry
    ${elements} =       Get WebElements     xpath://h4[@class='card-title']
    @{actualList} =       Create List
    FOR     ${element}      IN      @{elements}
            Log   ${element.text}
            Append To List     ${actualList}       ${element.text}

    END
    Lists Should Be Equal       ${expectedList}          ${actualList}

Select the card
    [arguments]     ${cardName}
    ${elements} =       Get WebElements     xpath://h4[@class='card-title']
    ${index}=   Set Variable    1
    FOR     ${element}      IN      @{elements}
            Exit For Loop If     '${cardName}' == '${element.text}'
            ${index} =      Evaluate     ${index} + 1

    END
    Click Button        xpath:(//div[@class='card-footer'])[${index}]/button

Validate the checkout count
    ${checkOut} =    Get Text        xpath://li[@class='nav-item active']
    Should Contain      ${checkOut}     3


Fill the login details and select the user option
    input text      id:username     rahulshettyacademy
    input password      id:password     learning
    Click Element       xpath://input[@value='user']
    Wait Until Element Is Visible       xpath://div[@class='modal-body']
    Click Element       xpath://button[@id='okayBtn']
    Select From List By Value       //select[@class='form-control']         teach

