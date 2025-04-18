# Tämä testi avaa Ylen etusivun ja tarkistaa, että sana "uutiset" löytyy sivulta.
# This test opens Yle’s homepage and checks that the word "uutiset" (news) is present on the page.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
Yle Homepage Loads
    Open Browser    https://yle.fi    ${BROWSER}    options=${OPTIONS}
    Title Should Contain    Yle
    Page Should Contain    uutiset
    [Teardown]    Close Browser
