# Tämä testi avaa Googlen ja hakee "Robot Framework" -termin varmistaakseen, että hakutuloksia saadaan.
# This test opens Google, searches for "Robot Framework", and verifies that search results appear.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
Google Search Shows Results
    Open Browser    https://www.google.com    ${BROWSER}    options=${OPTIONS}
    Input Text      name=q    Robot Framework
    Press Keys      name=q    RETURN
    Page Should Contain    robotframework.org
    [Teardown]    Close Browser
