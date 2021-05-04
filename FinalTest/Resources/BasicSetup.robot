*** Settings ***
Library  SeleniumLibrary
*** Keywords ***
Start Test
    [Arguments]  ${url}
    open browser  ${url}  chrome
    maximize browser window
End Test
    close browser
