*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.wikipedia.org

*** Test Cases ***
Wikipedia Page Should Load Successfully
    Open Browser    ${URL}    chrome
    Title Should Be    Wikipedia
    [Teardown]    Close Browser