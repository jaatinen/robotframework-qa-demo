*** Settings ***
Documentation     JSONPlaceholder (POST ja DELETE)
Library           RequestsLibrary
Library           Collections

Suite Setup       Setup JSONPlaceholder Session
Suite Teardown    Delete All Sessions

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com

*** Keywords ***
Setup JSONPlaceholder Session
    Delete All Sessions
    Create Session    json    ${BASE_URL}    verify=False

*** Test Cases ***
POST New Post Should Return 201 And Have Id
    [Documentation]    POST /posts → 201 Created ja vastaus sisältää id-kentän
    ${payload}=    Create Dictionary    title=foo    body=bar    userId=1
    ${headers}=    Create Dictionary    Content-Type=application/json

    ${resp}=       POST On Session      json    /posts    json=${payload}    headers=${headers}
    Should Be Equal As Integers        ${resp.status_code}    201

    ${json}=       Set Variable         ${resp.json()}
    Dictionary Should Contain Key       ${json}    id

DELETE Post 1 Should Return 200 And Empty Json
    [Documentation]    DELETE /posts/1 → 200 OK ja JSON-body on tyhjä sanakirja
    ${resp2}=      DELETE On Session    json    /posts/1
    Should Be Equal As Integers        ${resp2.status_code}   200

    ${json2}=      Set Variable         ${resp2.json()}
    Should Be Empty                     ${json2}