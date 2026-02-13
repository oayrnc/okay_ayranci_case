*** Settings ***
Resource            ../../resources/base/master.resource
Suite Setup         Create Session    petstore    ${base_url}    verify=True

*** Test Cases ***
Create Pet And Verify Response
    [Documentation]    verify that a new pet can be created.
    [Tags]    api    positive
    ${resp}    Create New Pet    ${valid_pet_id}    Karabas    available
    Should Be Equal As Numbers    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['name']}    Karabas

Get Pet By ID And Verify Details
    [Documentation]    verify that pet details can be retrieved by id.
    [Tags]    api    positive
    ${resp}    Get Pet Details    ${valid_pet_id}
    Should Be Equal As Numbers    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['id']}    ${valid_pet_id}

Update Pet Information And Verify Change
    [Documentation]    verify that pet information can be updated.
    [Tags]    api    positive
    ${resp}    Update Pet Details    ${valid_pet_id}    Karabas123    sold
    Should Be Equal As Numbers    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['status']}    sold

Delete Pet And Verify Success
    [Documentation]    verify that a pet can be deleted from the system.
    [Tags]    api    positive
    ${resp}    Delete Pet From System    ${valid_pet_id}
    Should Be Equal As Numbers    ${resp.status_code}    200

Verify Error For Non-Existing Pet
    [Documentation]    verify that retrieving a non-existing pet returns a 404 error.
    [Tags]    api    negative
    ${resp}    Get Pet Details    ${invalid_pet_id}
    Should Be Equal As Numbers    ${resp.status_code}    404
    Should Be Equal As Strings    ${resp.json()['message']}    Pet not found
