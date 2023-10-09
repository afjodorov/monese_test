*** Variables ***
# User consent popup that appears upon opening website
${ACCEPT_CONSENT_BUTTON}     xpath=//body/div[3]/div[2]/div[1]/div[2]/div[2]/button[1]

# Navigation
${NAV_BAR_BUTTON}            xpath=//*[@data-bs-target="#AppNavBar"]
${NAV_BAR_LOGIN_BUTTON}      xpath=//*[@id="AppNavBar"]/ul[1]/li[5]/a[1]

# Login type selection
${GMAIL_BUTTON}              xpath=//body/div[1]/div[1]/a[2]

# Google logging-in locators
${GMAIL_EMAIL_FIELD}         xpath=//*[@id="identifierId"]
${GMAIL_EMAIL_IDENT}         xpath=//input[@name="identifier"]
${GMAIL_EMAIL_NEXT_BUTTON}   xpath=//div[@id="identifierNext"]/div/button

${GMAIL_PSWD_FIELD}          xpath=//*[@id="password"]/div[1]/div[1]/div[1]/input[1]
${GMAIL_PSWD_IDENT}          xpath=//div[@id="password"]
${GMAIL_PSWD_NEXT_BUTTON}    xpath=//div[@id="passwordNext"]/div/button

# Logged-in users home
${ACCESS_TOKEN_VIEW}         xpath=//*[contains(@text,"Access Tokens")]
${ACCESS_TOKEN_LABEL}        xpath=//*/form/table/tbody/tr/td[2]