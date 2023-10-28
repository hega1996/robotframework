*** Settings ***
Library     DataDriver     file=src/resources/login_data.csv     encoding=utf_8
Suite Setup     Setup Browser
Test Template       Data driven login test
Resource    ../steps/setup_steps.resource

*** Test Cases ***

Login with user ${username} and password ${password}


*** Keywords ***
Data driven login test
    [Arguments]    ${username}     ${password}     ${success}
    New Page    https://www.saucedemo.com
    Fill Text    id=user-name    ${username}
    Fill Text    id=password    ${password}
    Click    id=login-button
    IF    '${success}' == 'yes'
        Wait For Condition      Element Count    //input[contains(@data-test,'login-button')]      <     1
    ELSE
        Wait For Condition      Element Count    //input[contains(@data-test,'login-button')]      >     0
    END
    Take Screenshot