*** Settings ***
Resource            ../../resources/base/master.resource
Test Setup        test_setup
Test Teardown     Close Browser    


*** Test Cases ***
Verify Insider Homepage Is Opened And All Main Blocks Are Loaded
    [Documentation]    verify that the homepage is loaded and all main blocks are visible.
    [Tags]    ui
    check_cookie_bar
    Verify Homepage Loaded