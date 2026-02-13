*** Settings ***
Resource            ../base/master.resource

*** Variables ***
${homepage_be_unstoppable_h1}    xpath=//h1[contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),'be unstoppable')]
${homepage_header}              xpath=//header
${homepage_trusted_by_h2}       xpath=//h2[contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),'trusted by')]
${homepage_footer}              xpath=//footer[@id='footer']

*** Keywords ***
Verify Homepage Loaded
    Wait Until Element Is Visible    ${homepage_be_unstoppable_h1}    timeout=10s
    Element Should Be Visible    ${homepage_header}
    Element Should Be Visible    ${homepage_be_unstoppable_h1}
    Element Should Be Visible    ${homepage_trusted_by_h2}
    Element Should Be Visible    ${homepage_footer}
