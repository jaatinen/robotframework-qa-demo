*** Settings ***
Documentation     Reqres.in – täydellinen CRUD‐testipaketti
Library           RequestsLibrary

Suite Setup       Setup Reqres Session
Suite Teardown    Delete All Sessions

*** Variables ***
${BASE_URL}       https://reqres.in

*** Keywords ***
Setup Reqres Session 
    Delete All Sessions
    Create Session    reqres    ${BASE_URL}    verify=False

*** Test Cases ***
Get List Of Users Should Return 200
    [Documentation]    GET /api/users?page=2 → 200 OK ja “page”:2 vastauksessa
    ${resp}=    GET On Session    reqres    /api/users    params=page=2
    Should Be Equal As Integers    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    Should Be Equal As Integers    ${json['page']}    2