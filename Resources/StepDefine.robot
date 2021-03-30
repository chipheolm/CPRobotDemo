*** Settings ***
Library  SeleniumLibrary
Resource  ElementDefine.robot
*** Keywords ***
Input search text
    [Arguments]  ${Text}
    input text  ${SearchTextBox}  ${Text}
Click search button
    click button  ${SearchButton}
Wait for expected text visible
    wait until element is visible  //*[@id="__next"]/div[1]/main/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/h1
Scroll to expected device
    scroll element into view  //*[@id="__next"]/div[1]/main/div[2]/div[1]/div[2]/div[1]/div[2]/a[21]/span/div/div[2]/div[2]/span
