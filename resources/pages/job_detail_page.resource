*** Settings ***
Resource            ../base/master.resource

*** Variables ***
${apply_for_this_job_button}    xpath=//a[contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),'apply for this job')]

*** Keywords ***
Verify Lever Application Page Opened
    Switch Window    NEW
    Wait Until Element Is Visible    ${apply_for_this_job_button}    timeout=10s
    Location Should Contain    jobs.lever.co