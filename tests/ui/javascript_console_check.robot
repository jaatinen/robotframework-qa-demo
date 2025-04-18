# Tämä testi avaa robotframework.org-sivun ja tarkistaa, ettei selaimen JavaScript-konsolissa ole virheitä.
# This test opens robotframework.org and ensures there are no JavaScript errors in the browser console.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OPTIONS}    add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
${BROWSER}    chrome

*** Test Cases ***
No JS Errors On Robot Framework Page
    Open Browser    https://robotframework.org    ${BROWSER}    options=${OPTIONS}
    ${logs}=    Execute Javascript    return window.console.error || null;
    Should Be Empty    ${logs}
    [Teardown]    Close Browser
