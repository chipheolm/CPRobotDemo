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
${path}  image.png
${text}
*** Test Cases ***
Test get VND performance price on GoldPrice
    [Tags]    TC1
    Select VND unit
    sleep  2S
    Get Gold performance image  ${path}
    ${text}  get text from image  Results/R2/${path}
    log  ${text}
    write file  ${text}
    ${index}  get price performance  text.txt  6 Months
    log  ${index}
*** Keywords ***
