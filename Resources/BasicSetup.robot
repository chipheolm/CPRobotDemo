*** Settings ***
Library  SeleniumLibrary
*** Keywords ***
Start Test
    open browser  https://goldprice.org/  chrome
    maximize browser window
End Test
    close browser
