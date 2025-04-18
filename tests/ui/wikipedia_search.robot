# Tämä testi avaa Wikipedian, hakee "Test automation" ja tarkistaa, että tulossivu sisältää aiheeseen liittyvää sisältöä.
# This test opens Wikipedia, searches for "Test automation", and checks that the result page contains related content.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
Wikipedia Search Works
    Open Browser    https://www.wikipedia.org    ${BROWSER}    options=${OPTIONS}
    Input Text      id=searchInput    Test automation
    Click Button    xpath=//button[@type="submit"]
    Page Should Contain    software testing
    [Teardown]    Close Browser
