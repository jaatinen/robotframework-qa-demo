*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.wikipedia.org

*** Test Cases ***
Wikipedia Page Should Load Successfully
    Open Browser    ${URL}    firefox
    Title Should Be    Wikipedia
    [Teardown]    Close Browser