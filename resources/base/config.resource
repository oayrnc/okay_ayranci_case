*** Settings ***
Resource            libraries.resource

*** Variables ***
# Environment Settings
${url}            https://insiderone.com/
${job_list_url}   https://insiderone.com/careers/quality-assurance/
${browser}        chrome    # Can be overridden from CLI: --variable browser:firefox

# API Variables
${base_url}         https://petstore.swagger.io/v2
${valid_pet_id}     9223372036854775123
${invalid_pet_id}   0000000000000000000
