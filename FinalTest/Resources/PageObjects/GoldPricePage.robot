*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections
Library  ImageToTextLibrary
*** Variables ***
${gold_price_url}  http://goldprice.org/
${performance_price_unit}  xpath://select[@id='gpxPerformanceGold_currency']
${gold_price_performace_image}  xpath://img[@id='gpxPerformanceGold_img']
${current_gold_money_unit_select}  xpath://select[@id='gpxtickerLeft_curr']
${current_gold_weight_unit}  xpath://select[@id='gpxtickerLeft_wgt-au']
${current_price}  xpath://span[@id='gpxtickerLeft_price']
*** Keywords ***
Select price performace money unit
    [Arguments]  ${money_unit}
    select from list by value  ${performance_price_unit}  ${money_unit}
    sleep  2S
Get text from gold performance image
    [Arguments]  ${image_name}
    capture element screenshot  ${gold_price_performace_image}  ${image_name}
    ${text}  get text from image  ${OUTPUTDIR}/${image_name}
    ${text_redefine}  replace string  ${text}  \n\n  \n
    ${draft_text}  get lines containing string  ${text_redefine}  goldprice.org
    ${text_redefine}  remove string  ${text_redefine}  ${draft_text}
    ${text_redefine}  replace string  ${text_redefine}  \n\n  \n
    return from keyword  ${text_redefine}
Get price change by time stamp
    [Arguments]  ${text}  ${time_stamp}
    ${lines}  split to lines  ${text}
    ${index}  get index from list  ${lines}  ${time_stamp}
    ${index}  evaluate  ${index} + 7
    ${value}  get from list  ${lines}  ${index}
    log  The price changes for ${time_stamp} is ${value}
Get current gold price
    [Arguments]  ${money_unit}  ${weight_unit}
    select from list by value  ${current_gold_money_unit_select}  ${money_unit}
    select from list by value  ${current_gold_weight_unit}  ${weight_unit}
    ${price}  get text  ${current_price}
    ${price}  remove string  ${price}  ,
    ${price}  convert to number  ${price}
    return from keyword  ${price}
