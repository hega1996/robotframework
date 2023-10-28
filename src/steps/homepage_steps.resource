*** Settings ***
Resource       ../pages/home_page.resource
Resource       ../pages/mini_app_page.resource
Library        Browser

*** Keywords ***

Navigate to Mini App
    [Arguments]     ${mini_app_name}
    Log To Console    Attempting to navigate to ${mini_app_name} mini app page
    Wait For Elements State    ${HOMEPAGE_LOGO}     visible
    ${app_locator}     Get app locator    ${mini_app_name}
    Scroll To Element    ${app_locator}
    Click    ${app_locator}
    Wait For Elements State    ${MINI_APP_PAGE_APPS_LINK}    visible
    Wait For Function    document.readyState === 'complete'
    Take Screenshot     EMBED    fullPage=TRUE
    Log To Console    Arrived to ${mini_app_name} mini app page
    