*** Settings ***
Library  SeleniumLibrary
Documentation    This is test suite for the final test.
Resource  ../Resources/BasicSetup.robot
Resource  ../Resources/PageObjects/GoldPricePage.robot
Resource  ../Resources/PageObjects/BTMCPage.robot
Test Teardown  end test
*** Variables ***
${tc3_image}  tc3_image.png
@{gold_change_time_stamp}  Today  30 Days  6 Months  1 Year  5 Years  20 Years
&{money_unit}  usd=USD  vnd=VND
&{weight_unit}  g=g  oz=oz  kg=kg
&{gold_type}  sjc=VÀNG MIẾNG SJC  btmc=VÀNG TRANG SỨC
${world_gold}  World Gold
*** Test Cases ***
Compare gold price between BTMC with SJC from btmc.vn
    [Tags]  TC1
    start test  ${btmc_url}
    ${list_text}  Get gold tile list
    ${sjc_price}  Get a mace of gold price in VND  ${list_text}  ${gold_type.sjc}
    ${sjc_price}  Get 1 ounce gold price  ${sjc_price}  ${gold_type.sjc}
    set global variable  ${sjc_price}
    ${btmc_price}  Get a mace of gold price in VND  ${list_text}  ${gold_type.btmc}
    ${btmc_price}  Get 1 ounce gold price   ${btmc_price}  ${gold_type.btmc}
    compare 1 ounce gold price between  ${gold_type.sjc}  ${sjc_price}  ${gold_type.btmc}  ${btmc_price}
Compare price between World Gold with SJC gold
    [Tags]  TC2
    start test  ${gold_price_url}
    ${world_gold_price}  Get current gold price  ${money_unit.vnd}  ${weight_unit.oz}
    compare 1 ounce gold price between  ${world_gold}  ${world_gold_price}  ${gold_type.sjc}  ${sjc_price}
Get gold price change by time on GoldPrice
    [Tags]  TC3
    start test  ${gold_price_url}
    Select price performace money unit  ${money_unit.vnd}
    ${text}  Get text from gold performance image  ${tc3_image}
    Get price change by time stamp  ${text}  ${gold_change_time_stamp}[1]
    Get price change by time stamp  ${text}  ${gold_change_time_stamp}[2]

