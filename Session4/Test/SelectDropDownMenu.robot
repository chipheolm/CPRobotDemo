*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Test Teardown  end test
*** Test Cases ***
Test drop down menu of tiki
    [Tags]    TC1
    start test  https://tiki.vn
    mouse over  xpath://header/div[1]/div[1]/div[1]/div[1]/div[2]/a[1]
    sleep  2S
    Handle Alert  DISMISS
    open context menu  xpath://*[@id="__next"]/div[1]/header/div[1]/div/div[1]/div[1]/div[2]/div/ul/li[2]
    capture page screenshot  image.png
*** Keywords ***
Start Test
    [Arguments]  ${url}
    open browser  ${url}  chrome
    sleep  4S
    maximize browser window
End Test
    close browser