*** Settings ***
Library  SeleniumLibrary
*** Keywords ***
Start Test
    [Arguments]  ${url}
    open browser  ${url}  chrome
    sleep  2S
    maximize browser window
End Test
    close browser
