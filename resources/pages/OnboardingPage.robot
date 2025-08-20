*** Settings ***
Library    AppiumLibrary
Library    Collections

*** Variables ***
&{ANDROID_LOCATORS}
...    BOTON_SIGUIENTE=accessibility_id=Siguiente   
...    BOTON_COMENZAR=accessibility_id=Comenzar
&{IOS_LOCATORS}        
...    BOTON_SIGUIENTE=accessibility_id=Siguiente   
...    BOTON_COMENZAR=accessibility_id=Comenzar

*** Keywords ***
_locator
    [Arguments]    ${name}
    ${is_android}=    Run Keyword And Return Status    Should Be Equal As Strings    ${PLATFORM}    Android
    IF    ${is_android}
        ${loc}=    Get From Dictionary    ${ANDROID_LOCATORS}    ${name}
    ELSE
        ${loc}=    Get From Dictionary    ${IOS_LOCATORS}    ${name}
    END
    RETURN    ${loc}

Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    ${btn_siguiente}=    _locator    BOTON_SIGUIENTE
    ${btn_comenzar}=    _locator    BOTON_COMENZAR
    Wait Until Page Contains Element    ${btn_siguiente}    5s
    Click Element    ${btn_siguiente}
    Wait Until Page Contains Element    ${btn_siguiente}    5s
    Click Element    ${btn_siguiente}
    Wait Until Page Contains Element    ${btn_siguiente}    5s
    Click Element    ${btn_siguiente}
    Wait Until Page Contains Element    ${btn_comenzar}    5s
    Click Element    ${btn_comenzar}
    