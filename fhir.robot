*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${FHIR_BASE}     https://fhir.simplifier.net/R4
${APPT_ID}       f7bf2300-912c-4dd0-ae92-84ab50396dbe

*** Test Cases ***
Validate FHIR Appointment Resource
    [Documentation]
    ...    Hae Appointment-resurssi ja tarkista keskeiset kentät JSON-vastauksesta

    # 1) Avaa sessio ilman sertifikaattitarkistusta
    Create Session    fhir    ${FHIR_BASE}    verify=False

    # 2) Hae JSON
    ${hdrs}=          Create Dictionary    Accept=application/fhir+json
    ${resp}=          GET On Session       fhir    /Appointment/${APPT_ID}    headers=${hdrs}
    Status Should Be  200                  ${resp}

    # 3) Muunna vastaus dictiksi
    ${json}=          Set Variable         ${resp.json()}

    # 4) Yleiset kentät
    Should Be Equal   ${json['resourceType']}    Appointment
    Should Be Equal   ${json['id']}              ${APPT_ID}
    Should Be Equal   ${json['status']}          booked

    # 5) Tarkista ssn ensimmäisestä contained-Patientista
    ${first}=         Get From List    ${json['contained']}       0
    ${ident0}=        Get From List    ${first['identifier']}     0
    Should Be Equal   ${ident0['value']}          300111A9001

    # 6) Tarkista ajanvaraustyypin koodi toisesta participant-elementistä
    ${second}=        Get From List    ${json['participant']}     1
    ${coding}=        Get From List    ${second['type'][0]['coding']}    0
    Should Be Equal   ${coding['code']}            2

    # 7) Aikaleiman muoto
    Should Match Regexp    ${json['start']}    2023-06-10T\\d{2}:\\d{2}:\\d{2}\\+00:00