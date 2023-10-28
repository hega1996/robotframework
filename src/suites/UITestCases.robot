*** Settings ***
Library    Browser
Resource    ../steps/setup_steps.resource
Resource    ../steps/homepage_steps.resource

Suite Setup     Setup Browser

*** Variables ***
${dummy_file_path}    D:/Work/robotframework/src/resources/dummy_document.docx

*** Test Cases ***
File upload scenario
    [Tags]    111
    [Setup]    New Page    ${URL}
    Navigate to Mini App    Upload File
    Upload File By Selector    ${MINI_APP_PAGE_FILE_UPLOAD_INPUT}    ${dummy_file_path}
    Wait For Condition    Text    ${MINI_APP_PAGE_FILE_NUMBER_COUNTER}    ==    1 File Selected
    Log To Console    File uploaded successfully

Switch browser window
    [Tags]    112
    [Setup]    New Page    ${URL}
    Navigate to Mini App    Pop-Up Window
    Click    id=login
    ${original_page}=   Switch Page    NEW
    Take Screenshot     EMBED    fullPage=TRUE
    Click    text=Submit
    Switch Page    ${original_page}
    Take Screenshot     EMBED    fullPage=TRUE
    Wait For Elements State    text=Button Clicked

Wait for data fetching
    [Tags]    113
    [Setup]    New Page    ${URL}
    Navigate to Mini App    Fetching Data
    Wait Until Keyword Succeeds    10s    500ms    Wait Until Network Is Idle
    Wait For Function    document.readyState === 'complete'
    Take Screenshot
    ${number_of_data_cards}    Get Element Count    ${MINI_APP_PAGE_DATA_FETCH_CARDS}
    Log To Console     ${number_of_data_cards} data cards found on the page

Close popup ad if displayed
    [Tags]    114
    [Setup]    New Page    ${URL}
    Navigate to Mini App    Onboarding Modal Popup
    ${is_visible}     Run Keyword And Return Status
     ...    Wait For Condition    Element States    text=Application successfully launched! 🚀    contains    visible    timeout=3s
    IF    ${is_visible}
        Log To Console    Popup did not pop up!
    ELSE
        Log To Console    Popup displayed, closing it now...
        Click    ${MINI_APP_PAGE_POPUP_CLOSE_BUTTON}
        Wait For Elements State    text=Welcome Peter Parker! 🕷🎉
    END
    Take Screenshot     EMBED    fullPage=TRUE