# Monese test assignment

The purpose of this project was to automate both UI and API parts of the test resource https://gorest.co.in/
Currently is developed for Android

## Project description

This project uses RobotFramework + Appium for both UI and API tests for connected real-device mobile.

**Tests/UI_tests.robot** - Opens  https://gorest.co.in/ url on chrome browser, logs in via google account and retrieves bearer token that was created at gorest website

**Tests/API_tests.robot** - Using the predefined bearer token, makes requests to the gorest APIs to

- Create a user
- Create a post for this user
- Change a user's status to inactive
- Delete a user and verify that both user and post are unreachable

**Resources/locators.robot** - Android locators for  https://gorest.co.in/
**Resources/global_keywords.robot** - Reusable keywords serving general purposes
**Resources/conf_variables.robot** - Test configuration holding test data and endpoints

**Report/API_test_report.html** - Successful run report example for API tests
**Report/UI_test_report.html** - Successful run report example of UI tests

## Test execution commands
Launch Appium server on your machine
`appium --base-path /wd/hub`

For executing API tests only from root folder
`robot Tests/API_tests.robot`

For executing UI tests only from root folder
`robot Tests/UI_tests.robot`

## Project setup

In order to run this project, the following steps should be taken

1. Install Python
2. Install Pip
3. Install RobotFramework `pip install robotframework`
4. Install AppiumLibrary `pip install robotframework-appiumlibrary`
5. Install RequestsLibrary `pip install robotframework-requests`
6. Install NPM
7. Install Appium server `npm i --location=global appium`
8. Install Java JDK - https://www.guru99.com/install-java.html
9. Install Android SDK - https://developer.android.com/tools/sdkmanager

## Future development

Create a solution to pass bearer token from UI_tests to API_tests so that these tests could run sequentially.
This could be achieved using `Set Global Variable` keyword and `[Tags]` parameters for test case

