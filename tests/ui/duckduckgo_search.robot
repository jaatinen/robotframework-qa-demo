# Tämä testi suorittaa haun DuckDuckGossa ja tarkistaa, että hakutulokset sisältävät "robotframework.org".
# This test performs a search on DuckDuckGo and verifies that the search results contain "robotframework.org".
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
DuckDuckGo Search Works
    Open Browser    https://duckduckgo.com    ${BROWSER}    options=${OPTIONS}
    Input Text      id=search_form_input_homepage    Robot Framework
    Click Button    id=search_button_homepage
    Page Should Contain    robotframework.org
    [Teardown]    Close Browser
