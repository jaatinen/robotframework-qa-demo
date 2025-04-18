# Tämä testi tarkistaa, että Robot Frameworkin virallinen sivusto latautuu ja otsikko on oikein.
# This test verifies that the official Robot Framework website loads and the page title is correct.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
Robot Framework Website Loads
    Open Browser    https://robotframework.org    ${BROWSER}    options=${OPTIONS}
    Title Should Be    Robot Framework
    [Teardown]    Close Browser
