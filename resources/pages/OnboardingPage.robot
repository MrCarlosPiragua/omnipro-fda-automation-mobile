*** Settings ***
Library    AppiumLibrary
Library    Collections

*** Variables ***
&{ONBOARDING_ANDROID_LOCATORS}
...    BOTON_SIGUIENTE=accessibility_id=Siguiente
...    BOTON_COMENZAR=accessibility_id=Comenzar
&{ONBOARDING_IOS_LOCATORS}
...    BOTON_SIGUIENTE=accessibility_id=Siguiente
...    BOTON_COMENZAR=accessibility_id=Comenzar

*** Keywords ***
_locator
    [Arguments]    ${name}
    ${is_android}=    Run Keyword And Return Status    Should Be Equal As Strings    ${PLATFORM}    Android
    IF    ${is_android}
        ${loc}=    Get From Dictionary    ${ONBOARDING_ANDROID_LOCATORS}    ${name}
    ELSE
        ${loc}=    Get From Dictionary    ${ONBOARDING_IOS_LOCATORS}    ${name}
    END
    RETURN    ${loc}

Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    ${BOTON_SIGUIENTE}=    _locator    BOTON_SIGUIENTE
    ${BOTON_COMENZAR}=    _locator    BOTON_COMENZAR
    Wait Until Element Is Visible    ${BOTON_SIGUIENTE}    5s
    Tap    ${BOTON_SIGUIENTE}    duration=0.5s
    Wait Until Element Is Visible    ${BOTON_SIGUIENTE}    5s
    Tap    ${BOTON_SIGUIENTE}    duration=0.5s
    Wait Until Element Is Visible    ${BOTON_SIGUIENTE}    5s
    Tap    ${BOTON_SIGUIENTE}    duration=0.5s
    Wait Until Element Is Visible    ${BOTON_COMENZAR}    5s
    Tap    ${BOTON_COMENZAR}    duration=0.5s
