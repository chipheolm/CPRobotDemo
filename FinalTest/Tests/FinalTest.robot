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
${TC3Image}  tc3_image.png
@{GoldChangeTimeStamp}  Today  30 Days  6 Months  1 Year  5 Years  20 Years
&{money_unit}  usd=USD  vnd=VND
&{gold_type}  sjc=VÀNG MIẾNG SJC  btmc=VÀNG TRANG SỨC
*** Test Cases ***
Compare gold price from BTMC with SJC from btmc.vn
    [Tags]  TC1  TC2  TC3
    start test  ${btmc_url}
    ${list_text}  Get gold tile list
    ${sjc_price}  get buying gold price  ${list_text}  ${gold_type.sjc}
    ${sjc_price}  Get 1 ounce gold price  ${sjc_price}  ${gold_type.sjc}
    ${btmc_price}  get buying gold price  ${list_text}  ${gold_type.btmc}
    ${btmc_price}  Get 1 ounce gold price   ${btmc_price}  ${gold_type.btmc}
    compare 1 ounce gold price between  ${gold_type.sjc}  ${sjc_price}  ${gold_type.btmc}  ${btmc_price}
Compare price between world gold price with SJC gold price
    [Tags]  TC1  TC2  TC3
    start test  BTMCPage.${btmc_url}
Get gold price change by time on GoldPrice
    [Tags]  TC1  TC2  TC3
    start test  ${gold_price_url}
    Select price performace money unit  ${money_unit.vnd}
    Get Gold performance image  ${TC3Image}
    ${text}  get text from image  ${OUTPUTDIR}/${TC3Image}
    Get price change by time stamp  ${text}  ${GoldChangeTimeStamp}[1]
    Get price change by time stamp  ${text}  ${GoldChangeTimeStamp}[2]

