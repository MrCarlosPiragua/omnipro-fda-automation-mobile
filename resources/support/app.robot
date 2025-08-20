*** Settings ***
Library    AppiumLibrary
Library    DateTime
Library    BuiltIn

*** Keywords ***
Abrir app
    ${platform}=    Get Variable Value    ${PLATFORM}    Android
    Run Keyword If    "${platform}"!="Android" and "${platform}"!="iOS"    Fail    msg=PLATFORM debe ser Android o iOS

    ${server}=    Get Variable Value    ${APPIUM_SERVER}    http://127.0.0.1:4723/wd/hub
    ${no_reset}=  Get Variable Value    ${NO_RESET}    ${False}
    ${timeout}=   Get Variable Value    ${NEW_COMMAND_TIMEOUT}    120
    ${autoGrantPermissions}=   Get Variable Value    ${AUTO_GRANT_PERMISSIONS}    true

    ${sec}=    Get Current Date    result_format=epoch
    ${TIMESTAMP_MS}=  Evaluate    int(round(${sec} * 1000))
    Set Test Variable    ${TIMESTAMP_TO_SEARCH}       ${TIMESTAMP_MS}

    IF    "${platform}" == "Android"
        ${automation}=    Get Variable Value    ${AUTOMATION_NAME}    UiAutomator2
        ${device}=        Get Variable Value    ${DEVICE_NAME}       emulator-5554
        ${pkg}=           Get Variable Value    ${APP_PACKAGE}       ${None}
        ${act}=           Get Variable Value    ${APP_ACTIVITY}      ${None}
        Open Application    ${server}
        ...    platformName=${platform}
        ...    automationName=${automation}
        ...    deviceName=${device}
        ...    appPackage=${pkg}
        ...    appActivity=${act}
        ...    noReset=${no_reset}
        ...    newCommandTimeout=${timeout}
        ...    autoGrantPermissions=${autoGrantPermissions}
    ELSE
        ${automation}=    Get Variable Value    ${AUTOMATION_NAME}    XCUITest
        ${device}=        Get Variable Value    ${DEVICE_NAME}       iPhone 15
        ${bundle}=        Get Variable Value    ${BUNDLE_ID}         ${None}
        Open Application    ${server}
        ...    platformName=${platform}
        ...    automationName=${automation}
        ...    deviceName=${device}
        ...    bundleId=${bundle}
        ...    noReset=${no_reset}
        ...    newCommandTimeout=${timeout}
    END

Cerrar app
    Cerrar app si abierta

Cerrar app si abierta
    Run Keyword And Ignore Error    Close All Applications