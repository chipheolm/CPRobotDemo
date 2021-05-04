*** Settings ***
Library  SeleniumLibrary
Library  ImageToTextLibrary
Documentation    This is test suite for the final test.
Resource  ../Resources/BasicSetup.robot
Resource  ../Resources/PageObjects/GoldPricePage.robot
Resource  ../Resources/PageObjects/BTMCPage.robot
Test Teardown  end test
*** Variables ***
${path}
@{urls}  https://btmc.vn  https://goldprice.org/
@{gold_change_time_stamp}  Today  30 Days  6 Months  1 Year  5 Years  20 Years
*** Test Cases ***
Compare gold price from BTMC with SJC from btmc.vn
    [Tags]  TC1  TC2  TC3
    start test  ${urls}[0]
    ${list_text}  Get gold tile list
    get buying gold price  ${list_text}  VÀNG MIẾNG SJC
    get buying gold price  ${list_text}  VÀNG TRANG SỨC
#Compare price between world gold price with SJC gold price
#    [Tags]  TC1  TC2  TC3
#    start test  ${urls}[0]
#    end test
#Get gold price change by time on GoldPrice
#    [Tags]  TC1  TC2  TC3
#    start test  ${urls}[1]
#    Select money unit  VND
#    Get Gold performance image  image.png
#    ${text}  get text from image  ${OUTPUTDIR}/image.png
#    Get price change by time stamp  ${text}  ${gold_change_time_stamp}[1]
#    Get price change by time stamp  ${text}  ${gold_change_time_stamp}[2]
#    end test

