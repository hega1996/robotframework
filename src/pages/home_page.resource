*** Settings ***
*** Variables ***

${HOME_PAGE_LOGO}    //a[@class='item logo']

*** Keywords ***
Get app locator
    [Arguments]     ${mini_app_name}
    RETURN      //h3[text()='${mini_app_name}']