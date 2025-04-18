*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${OPTIONS}        --headless --no-sandbox --disable-dev-shm-usage

*** Test Cases ***
Wikipedia Page Should Load Successfully
    Open Browser    https://www.wikipedia.org    ${BROWSER}    options=${OPTIONS}
    Title Should Be    Wikipedia
    [Teardown]    Close Browser