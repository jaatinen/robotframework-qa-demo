# Tämä testi avaa Ylen etusivun ja klikkaa uutislinkkiä varmistaen, että uutissivu avautuu.
# This test opens Yle’s homepage, clicks the news link, and ensures that the news page is displayed.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
Yle News Link Navigates
    Open Browser    https://yle.fi    ${BROWSER}    options=${OPTIONS}
    Click Link      uutiset
    Page Should Contain    Uutiset
    [Teardown]    Close Browser
