*** Settings ***
Library  SeleniumLibrary
Resource  ElementDefine.robot
*** Variables ***
${priceUnit}  xpath://select[@id='gpxPerformanceGold_currency']
${Cartlinktex}  Giỏ Hàng
${GoldPricePerformaceImage}  xpath://img[@id='gpxPerformanceGold_img']
*** Keywords ***
Select VND unit
    select from list by value  ${priceUnit}  VND
Get Gold performance image
    [Arguments]  ${path}
    capture element screenshot  ${GoldPricePerformaceImage}  ${path}