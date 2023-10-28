*** Settings ***
Library    Browser

*** Variables ***
${URL}     https://qaplayground.dev
${HEADLESS}     ${False}

*** Keywords ***
Setup Browser
    Log To Console    Starting browser...
    New Browser    browser=chromium    headless=${HEADLESS}   timeout=10s
    Log To Console    Browser started successfully
