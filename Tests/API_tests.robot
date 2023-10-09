*** Settings ***
Library     RequestsLibrary
Resource    ../Resources/global_keywords.robot

*** Variables ***
${test_users_name}             Alex Fjodorov
${test_users_email}            alex03@test.com
${test_users_gender}           male
${test_users_status}           active

${test_users_post_title}       Lorem ipsum
${test_users_post_body}        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
...    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
...    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

${created_users_id}            ${None}
${created_posts_id}            ${None}
${created_comments_id}         ${None}

*** Test Cases ***
Create active user
    ${body}=    Create Dictionary    name=${test_users_name}        email=${test_users_email}   gender=${test_users_gender}     status=${test_users_status}
    ${POST_resp}    POST to gorest    ${USER_ENDPOINT}    ${ACCESS_TOKEN_API}    ${body}

    Set Global Variable   ${created_users_id}    ${POST_resp.json()}[id]
    
    Verify new user has been created

Create post for user
    ${body}    Create Dictionary    user_id=${created_users_id}    title=${test_users_post_title}    body=${test_users_post_body}
    ${POST_resp}    POST to gorest    ${POSTS_ENDPOINT}    ${ACCESS_TOKEN_API}    ${body}
    
    Set Global Variable   ${created_posts_id}    ${POST_resp.json()}[id]

    Verify new post has been created
    
Change user status to inactive
    ${GET_inactive_users_post}    GET to gorest    ${POSTS_ENDPOINT}    ${ACCESS_TOKEN_API}    ${created_posts_id}

    ${PUT_resp}    PUT change user status    ${ACCESS_TOKEN_API}    ${created_users_id}    inactive

    Verify users status is inactive
    
Delete user
    Delete user from gorest    ${created_users_id}    ${ACCESS_TOKEN_API}

    Verify deleted user is unavailable

    Verify deleted users post is unavailable
    
*** Keywords ***
Verify new user has been created
    ${GET_created_user}    GET to gorest   ${USER_ENDPOINT}    ${ACCESS_TOKEN_API}    ${created_users_id}    
    
    Should Be Equal    ${GET_created_user.json()}[name]      ${test_users_name}
    Should Be Equal    ${GET_created_user.json()}[email]     ${test_users_email}
    Should Be Equal    ${GET_created_user.json()}[gender]    ${test_users_gender}
    Should Be Equal    ${GET_created_user.json()}[status]    ${test_users_status}

Verify new post has been created
    ${GET_created_post}    GET to gorest    ${POSTS_ENDPOINT}    ${ACCESS_TOKEN_API}    ${created_posts_id}    

    Should Be Equal    ${GET_created_post.json()}[user_id]      ${created_users_id}
    Should Be Equal    ${GET_created_post.json()}[title]        ${test_users_post_title}
    Should Be Equal    ${GET_created_post.json()}[body]         ${test_users_post_body}

Verify users status is inactive
    ${GET_inactive_users_status}    GET to gorest    ${USER_ENDPOINT}    ${ACCESS_TOKEN_API}    ${created_users_id}
    
    Should Be Equal As Strings    ${GET_inactive_users_status.json()}[status]    inactive

Verify deleted user is unavailable
    ${status}    Run Keyword And Return Status    Get deleted user
    
    Status Should Be    404    ${status}

Get deleted user
    GET to gorest   ${USER_ENDPOINT}    ${ACCESS_TOKEN_API}    ${created_users_id}

Verify deleted users post is unavailable
    ${status}    Run Keyword And Return Status    Get deleted users post
    
    Status Should Be    404    ${status}

Get deleted users post
    GET to gorest    ${POSTS_ENDPOINT}    ${ACCESS_TOKEN_API}    ${created_posts_id}

