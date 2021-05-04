*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections
*** Variables ***
${priceUnit}  xpath://select[@id='gpxPerformanceGold_currency']
${GoldPricePerformaceImage}  xpath://img[@id='gpxPerformanceGold_img']
*** Keywords ***
Select money unit
    [Arguments]  ${money_unit}
    select from list by value  ${priceUnit}  ${money_unit}
    sleep  2S
Get gold performance image
    [Arguments]  ${path}
    capture element screenshot  ${GoldPricePerformaceImage}  ${path}
Get price change by time stamp
    [Arguments]  ${text}  ${time_stamp}
    ${text_redefine}  replace string  ${text}  \n\n  \n
    ${draft_text}  get lines containing string  ${text_redefine}  goldprice.org
    ${text_redefine}  remove string  ${text_redefine}  ${draft_text}
    ${text_redefine}  replace string  ${text_redefine}  \n\n  \n
    ${lines}  split to lines  ${text_redefine}
    ${index}  get index from list  ${lines}  ${time_stamp}
    ${index}  evaluate  ${index} + 7
    ${value}  get from list  ${lines}  ${index}
    log  The price changes for ${time_stamp} is ${value}