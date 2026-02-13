***Settings***
Resource            master.resource

*** Keywords ***

test_setup
    [Documentation]    starts the browser and maximizes the window.
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

check_cookie_bar
    [Documentation]    checks and accepts the cookie bar.
    Wait Until Element Is Visible    xpath=//a[@id='wt-cli-accept-all-btn']    timeout=10s
    Highlight And Click    xpath=//a[@id='wt-cli-accept-all-btn']

test_setup_qa_jobs
    [Documentation]    starts the browser, navigates to qa jobs and accepts cookies.
    Open Browser    ${job_list_url}    ${browser}
    Maximize Browser Window
    check_cookie_bar