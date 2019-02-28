*** Settings ***
Documentation     THIS IS A DOC
Suite Setup       Log To Console    Test suite started
Suite Teardown    Log To Console    TEST SUITE COMPLETED
Library           ExtendedSelenium2Library

*** Variables ***
@{UserCredentials}    parkhval@gmail.com    12qw!@QW
${loginUrl}       https://dev-lt-portal.tk:50443/#/login    # DEV portal login urldrgtfrw
&{login}          Username=Valeriy    Password=1234qwer
${orig wait}      10 sec
${cookie}         ${EMPTY}

*** Test Cases ***
Login
    [Documentation]    LOL where is doc
    ExtendedSelenium2Library.Set Selenium Implicit Wait    ${orig wait}
    ExtendedSelenium2Library.open browser    ${loginUrl}    chrome
    ${cookie} =    Get Cookies
    Set Browser Implicit Wait    ${orig wait}
    ExtendedSelenium2Library.Maximize Browser Window
    Input Text    id=email    @{UserCredentials}[0]
    Input Password    id=password    @{UserCredentials}[1]
    Click Button    xpath=//*[contains(text(), ' Войти ')]
    Page Should Contain Element    id=user-nav-menu
    [Teardown]

openMyProfilePage
    ExtendedSelenium2Library.Set Selenium Implicit Wait    ${orig wait}
    Mouse Over    id=user-nav-menu
    Wait Until Element Is Visible    xpath=//*[contains(text(),'Мой профиль')]    ${orig wait}    error=not visible
    Click Element    xpath=//*[contains(text(),'Мой профиль')]    error=not clickable
    Page Should Contain Element    xpath=//*[contains(text(),' Привет Light ')]
    Wait Until Element Is Visible    xpath=//h5[contains(text(),'Знаю')]/a/i    timeout=10 sec    error=LOLOLO
    Click Element    xpath=//h5[contains(text(),'Знаю')]/a/i
    Click Element    xpath=//li/div/mz-collapsible-item-header[contains(text(), ' Languages ')]
    Click Element    xpath=//li/div/mz-collapsible-item-body/div[contains(text(),'CSS')]
    Click Element    xpath=//*[contains(text(),'Закрыть')]
    Page Should Contain Element    xpath=//*[contains(text(),'CSS')]
    Click Element    xpath=//*[@type='submit']
    Page Should Contain Element    id=toast-container

deleteSkill
    ExtendedSelenium2Library.Set Selenium Implicit Wait    ${orig wait}
    Mouse Over    id=user-nav-menu
    Wait Until Element Is Visible    xpath=//*[contains(text(),'Мой профиль')]    ${orig wait}    error=not visible
    Click Element    xpath=//*[contains(text(),'Мой профиль')]    error=not clickable
    Page Should Contain Element    xpath=//*[contains(text(),' Привет Light ')]
    Click Element    xpath=//div/div[contains(text(),'CSS')]/i
    Click Element    xpath=//*[@type='submit']
    Page Should Contain Element    id=toast-container
    Close Browser
