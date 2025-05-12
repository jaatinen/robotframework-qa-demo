*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Wikipedia Page Should Load Successfully
    Open Browser    https://www.wikipedia.org    chrome    options=add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
    Title Should Be    Wikipedia
    [Teardown]    Close Browser