*** Settings ***
Resource         ../../resources/base/master.resource
Test Setup        test_setup_qa_jobs
Test Teardown     Close Browser    


*** Test Cases ***
Check Job List
    [Documentation]    verify that the job list is displayed on the page.
    [Tags]    ui
    Highlight And Click    ${see_all_qa_jobs_button}
    Scroll To Element And Click    ${qa_job_list_item_first}
    highlight_element    ${qa_job_list_item_first}

Check all jobs 
    [Documentation]    verify that all jobs contain correct position, department and location.
    [Tags]    ui
    Filter QA Jobs By Location And Department    Istanbul, Turkiye    Quality Assurance
    Verify Job Results Contain Expected Info    Quality    Quality Assurance    Istanbul, Turkiye

Wiew Role Page Should Be Opened
    [Documentation]    verify that clicking view role opens the lever application page.
    [Tags]    ui
    Filter QA Jobs By Location And Department    Istanbul, Turkiye    Quality Assurance
    Scroll To Element And Click    ${view_role_button}
    Verify Lever Application Page Opened