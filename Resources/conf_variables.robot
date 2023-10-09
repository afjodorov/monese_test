*** Variables ***
#Automation setup and device settings
${REMOTE_URL}         http://127.0.0.1:4723/wd/hub
${DEVICE_NAME_LCL}    SM-G780G
${PLATFORM_NAME}      Android    
${AUTOMATION_NAME}    UiAutomator2

#Endpoints
${BASE_URL}           https://gorest.co.in
${API_VERSION}        /public/v2
${USER_ENDPOINT}      /users
${POSTS_ENDPOINT}     /posts
${COMMENTS_ENDPOINT}  /comments

${GOREST_EMAIL}       t7209317@gmail.com
${GOREST_PASS}        TestingAPI1234

#Access token to gorest API
${ACCESS_TOKEN_API}       c62b48db4dc5da50910891c9ce163e182e34d3946edecc62999ffa63e1f47150