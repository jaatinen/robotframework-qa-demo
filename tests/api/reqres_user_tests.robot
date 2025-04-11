*** Settings ***
Library           RequestsLibrary    # Kirjasto HTTP-pyyntöjen tekemiseen
Library           Collections        # Kirjasto sanakirjojen ja listojen käsittelyyn
Suite Setup       Create Session    reqres    https://reqres.in/api    verify=false    # Luo HTTP-istunto, jota käytetään kaikissa testeissä

*** Test Cases ***
Get List Of Users Should Return 200
    # Lähetetään GET-pyyntö käyttäjien listalle sivulta 2
    ${response}=    GET On Session    reqres    url=/users?page=2
    # Tarkistetaan että vastauskoodi on 200 (OK)
    Status Should Be    200    ${response}
    # Tarkistetaan että vastauksessa esiintyy "email"-kenttä
    Should Contain    ${response.content}    "email"

Create User Should Return 201
    # Luodaan testikäyttäjän tiedot sanakirjana
    ${data}=    Create Dictionary    name=TestQ    job=FinanssiAutomaatioOsaaja
    # Lähetetään POST-pyyntö uuden käyttäjän luomiseksi
    ${response}=    POST On Session    reqres    url=/users    json=${data}
    # Vastauskoodin tulee olla 201 (Created)
    Status Should Be    201    ${response}
    # Muutetaan vastaus JSON-muotoon
    ${json}=    Call Method    ${response}    json
    # Tarkistetaan että vastauksessa on "id"-avain
    Dictionary Should Contain Key    ${json}    id