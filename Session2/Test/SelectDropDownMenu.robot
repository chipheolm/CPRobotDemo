*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
#Test Teardown  end test
*** Test Cases ***
Test drop down menu of tiki
    [Tags]    TC1
    start test  https://tiki.vn
 #   wait until element is visible  css:#onesignal-slidedown-cancel-button  120s
 #s   click element  css:#onesignal-slidedown-cancel-button
    sleep  2s
    mouse over  xpath://header/div[1]/div[1]/div[1]/div[1]/div[2]/a[1]
    capture page screenshot  image1.png
    sleep  1s
    mouse over  css:#__next > div.home-page > header > div.Container-itwfbd-0.jFkAwY > div > div.Middle__LeftContainer-vop1h1-2.iPkVwM > div.logo-menu > div.style__Wrapper-mvfe96-0.kIrZeZ > div > ul > li:nth-child(2)
    sleep  2s
    capture page screenshot  image2.png
*** Keywords ***
Start Test
    [Arguments]  ${url}
    open browser  ${url}  chrome
    sleep  4S
    maximize browser window
End Test
    close browser