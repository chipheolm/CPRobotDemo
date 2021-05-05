*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections
Library  BuiltIn
*** Variables ***
${priceTable}  tag:table
@{list_text}

*** Keywords ***
Get buying gold price
    [Arguments]  ${list_text}  ${expected_gold_name}
    ${expected_index}  get index from list  ${list_text}  ${expected_gold_name}
    ${expected_index}  evaluate  ${expected_index} + 2
    ${value}  Get Table Cell  ${priceTable}  ${expected_index}  5
    return from keyword  ${value}
Get gold tile list
    Scroll Element Into View  xpath://tbody/tr[8]
    @{list}  get webelements  xpath://body/main[1]/section[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody/tr/td[2]
    FOR  ${item}  IN  @{list}
        ${text}  get text  ${item}
        append to list  ${list_text}  ${text}
    END
    return from keyword  ${list_text}
