*** Settings ***
Resource            ../base/master.resource

*** Variables ***
${see_all_qa_jobs_button}       xpath=//a[contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),'see all qa jobs')]
${qa_job_list_item_first}       xpath=(//div[contains(@class,'qualityassurance')])[1]
${filter_by_location_id}        id=filter-by-location
${filter_by_department_id}      id=filter-by-department
${jobs_list_container}          xpath=//div[@id='jobs-list']
${istanbul_qa_jobs_list}        xpath=//div[contains(@class,'qualityassurance') and contains(@class,'istanbulturkiye')]
${view_role_button}             xpath=//a[contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),'view role')]

*** Keywords ***
Filter QA Jobs By Location
    [Arguments]    ${location}
    Wait Until Element Is Visible    ${filter_by_location_id}    timeout=10s
    highlight_element    ${filter_by_location_id}
    Sleep    3s
    Select From List By Label    ${filter_by_location_id}    ${location}
    Sleep    1s

Filter QA Jobs By Department
    [Arguments]    ${department}
    Wait Until Element Is Visible    ${filter_by_department_id}    timeout=10s
    highlight_element    ${filter_by_department_id}
    Select From List By Label    ${filter_by_department_id}    ${department}
    Sleep    1s

Filter QA Jobs By Location And Department
    [Arguments]    ${location}    ${department}
    Highlight And Click    ${see_all_qa_jobs_button}
    Scroll To Element And Click    ${qa_job_list_item_first}
    Filter QA Jobs By Location    ${location}
    Filter QA Jobs By Department    ${department}
    Highlight And Click    locator=${jobs_list_container}

Verify Job Results Contain Expected Info
    [Arguments]    ${expected_title}    ${expected_department}    ${expected_location}
    ${count}=    Get Element Count    ${istanbul_qa_jobs_list}
    FOR    ${i}    IN RANGE  1  ${count}+1
        ${position_title}=    Get Text    xpath=(//div[contains(@class,'qualityassurance') and contains(@class,'istanbulturkiye')])[${i}]//p 
        ${position_department}=    Get Text    xpath=(//div[contains(@class,'qualityassurance') and contains(@class,'istanbulturkiye')])[${i}]//span
        ${position_location}=    Get Text    xpath=(//div[contains(@class,'qualityassurance') and contains(@class,'istanbulturkiye')])[${i}]//div
        Should Contain    ${position_title}    ${expected_title}     
        Should Contain    ${position_department}     ${expected_department}     
        Should Contain    ${position_location}      ${expected_location}
    END
