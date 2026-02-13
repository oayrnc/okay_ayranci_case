*** Settings ***
Resource            ../base/master.resource

*** Keywords ***
Create New Pet
    [Arguments]    ${id}    ${name}    ${status}
    ${category}    Create Dictionary    id=${0}    name=string
    ${photoUrls}   Create List          string
    ${tag_item}    Create Dictionary    id=${0}    name=string
    ${tags}        Create List          ${tag_item}
    ${body}        Create Dictionary    id=${id}    category=${category}    name=${name}    photoUrls=${photoUrls}    tags=${tags}    status=${status}
    ${response}    POST On Session    petstore    /pet    json=${body}    expected_status=any
    RETURN         ${response}

Get Pet Details
    [Arguments]    ${id}
    ${response}    GET On Session    petstore    /pet/${id}    expected_status=any
    RETURN         ${response}

Update Pet Details
    [Arguments]    ${id}    ${name}    ${status}
    ${category}    Create Dictionary    id=${0}    name=string
    ${photoUrls}   Create List          string
    ${tag_item}    Create Dictionary    id=${0}    name=string
    ${tags}        Create List          ${tag_item}
    ${body}        Create Dictionary    id=${id}    category=${category}    name=${name}    photoUrls=${photoUrls}    tags=${tags}    status=${status}
    ${response}    PUT On Session    petstore    /pet    json=${body}    expected_status=any
    RETURN         ${response}

Delete Pet From System
    [Arguments]    ${id}
    ${response}    DELETE On Session    petstore    /pet/${id}    expected_status=any
    RETURN         ${response}
