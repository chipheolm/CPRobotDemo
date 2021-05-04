*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections
Library  BuiltIn
*** Variables ***
${priceTable}  tag:table
*** Keywords ***
Get gold price
    [Arguments]  ${expected_gold_name}
    sleep  2S
    Scroll Element Into View  xpath://tbody/tr[8]
#    ${value}  Get Table Cell  ${priceTable}  8  5
#    Capture Element Screenshot  ${priceTable}  imageBTMC.png
    @{list}  get webelements  xpath://body/main[1]/section[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody/tr/td[2]
    FOR  ${item}  IN  @{list}
        ${text}  get text  ${item}
        exit for loop if  '${text}'=='${expected_gold_name}'
    END
    ${expected_index}  get index from list  ${list}  ${text}
    ${value}  Get Table Cell  ${priceTable}  ${expected_index}  5
