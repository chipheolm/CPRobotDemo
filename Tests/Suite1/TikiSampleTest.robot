*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description
Resource  ../../Resources/BasicSetup.robot
Resource  ../../Resources/StepDefine.robot
Test Setup  Start Test
Test Teardown  End Test
*** Test Cases ***
Test search a random key text on Tiki
    [Tags]    DEBUG
    input search text  điện thoại
    click search button
    wait for expected text visible
Test case for search baby toys
    [Tags]  DEBUG
    sleep  3s
    click to cart
    wait and continue shopping
*** Keywords ***
