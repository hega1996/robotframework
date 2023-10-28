*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${API_URL}      https://catfact.ninja

*** Test Cases ***
GET Cat breeds
    [Tags]      current
    Set Test Variable    &{HEADERS}       accept=application/json    X-CSRF-TOKEN=ouiuoFtYXrTrhN1P1XWv0rF65jhRQPgOtgpunwJg
    Create Session    catfact    ${API_URL}     headers=${HEADERS}
    ${response}=      GET On Session     catfact      breeds    params=limit=10
    Status Should Be  200  ${response}
    Log To Console    ${response.json()}[data]
    ${data}     Set Variable    ${response.json()}[data]
    Log To Console    The first breed is : ${data}[0][breed]
    Should Have Value In Json    ${data}     [0][country]