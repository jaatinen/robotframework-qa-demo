# Tämä testi tarkistaa, että Pythonin virallinen sivusto latautuu ja sivun otsikko on oikein.
# This test verifies that the official Python website loads and that the page title is correct.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
Python.org Website Loads
    Open Browser    https://www.python.org    ${BROWSER}    options=${OPTIONS}
    Title Should Contain    Welcome to Python.org
    [Teardown]    Close Browser
