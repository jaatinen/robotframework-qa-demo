# Tämä testi avaa GitHubin etusivun ja varmistaa, että se latautuu.
# This test opens GitHub's homepage and ensures it loads correctly.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
GitHub Homepage Opens
    Open Browser    https://github.com    ${BROWSER}    options=${OPTIONS}
    Title Should Contain    GitHub
    [Teardown]    Close Browser
