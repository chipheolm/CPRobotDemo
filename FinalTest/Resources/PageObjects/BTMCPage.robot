*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections
Library  BuiltIn
*** Variables ***
${btmc_url}  https://btmc.vn
${price_table}  tag:table
@{list_text}
${table_view}   xpath://tbody/tr[8]
${table_title}  xpath://body/main[1]/section[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody/tr/td[2]
*** Keywords ***
Get buying gold price
    [Arguments]  ${list_text}  ${expected_gold_name}
    ${expected_index}  get index from list  ${list_text}  ${expected_gold_name}
    ${expected_index}  evaluate  ${expected_index} + 2
    ${value}  Get Table Cell  ${price_table}  ${expected_index}  5
    ${value}  evaluate  ${value}*1000
    return from keyword  ${value}
Get gold tile list
    Scroll Element Into View  ${table_view}
    @{list}  get webelements  ${table_title}
    FOR  ${item}  IN  @{list}
        ${text}  get text  ${item}
        append to list  ${list_text}  ${text}
    END
    return from keyword  ${list_text}
Get 1 ounce gold price
    [Arguments]  ${input_price}  ${product_name}
    ${price}  evaluate  ${input_price}*10
    log  1 Ounce ${product_name} is priced at ${price} VND
    return from keyword  ${price}
Compare 1 ounce gold price between
    [Arguments]  ${name1}  ${price1}  ${name2}  ${price2}
    ${differenc_price}  evaluate  ${price1}-${price2}
    run keyword if  ${differenc_price}>0  log the result  ${name1}  ${differenc_price}  ${name2}
    ...     ELSE IF  ${differenc_price}==0  log  The price of ${name1} is equal ${name2}
    ...     ELSE  log the result  ${name2}  ${differenc_price}  ${name1}
log the result
    [Arguments]  ${name1}  ${price}  ${name2}
    ${price}  set variable  ${price.__abs__()}
    log  The price of ${name1} is greater than ${name2} : ${price} VND