*** Settings ***
Library  SeleniumLibrary
*** Keywords ***
Start Test
    open browser  https://tiki.vn  chrome
    maximize browser window
End Test
    close browser
