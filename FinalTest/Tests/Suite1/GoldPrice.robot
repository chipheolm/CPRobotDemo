*** Settings ***
Library  SeleniumLibrary
Library  ImageToTextLibrary
Library  ../../Resources/GetPricePerformance.py
Documentation    Suite description
Resource  ../../Resources/BasicSetup.robot
Resource  ../../Resources/GoldPriceObject.robot

Test Setup  Start Test
Test Teardown  End Test
*** Variables ***
${path}
${text}
*** Test Cases ***
Test get VND performance price on GoldPrice
    [Tags]    TC1
    Select VND unit
    sleep  2S
    Get Gold performance image  image.png
    ${text}  get text from image  Results/R2/image.png
    Get price change with time stamp  ${text}  6 Months

*** Keywords ***
Get price change with time stamp
    [Arguments]  ${text}  ${time_stamp}
    ${text_redefine}  replace string  ${text}  '\n\n'  '\n'
    log  ${text_redefine}
    ${index}  get line  ${text_redefine}  ${time_stamp}
    get line  ${text_redefine}  ${index}+7