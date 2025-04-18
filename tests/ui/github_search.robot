# Tämä testi suorittaa haun GitHubissa ja varmistaa, että hakutulokset sisältävät "robotframework".
# This test performs a search on GitHub and checks that the results include "robotframework".
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
GitHub Search Shows Results
    Open Browser    https://github.com    ${BROWSER}    options=${OPTIONS}
    Click Element   name=q
    Input Text      name=q    Robot Framework
    Press Keys      name=q    RETURN
    Page Should Contain    robotframework
    [Teardown]    Close Browser
