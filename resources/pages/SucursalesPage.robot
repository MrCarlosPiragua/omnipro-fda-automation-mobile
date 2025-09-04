*** Settings ***
Library    AppiumLibrary
Library    Collections

*** Variables ***
&{SUCURSALES_ANDROID_LOCATORS}
...    BUSCAR_SUCURSAL=xpath=//android.widget.EditText
...    SELECT_SUCURSAL_CIUDAD_MEXICO=xpath=(//android.widget.ImageView)[2]
...    SELECT_SUCURSAL=xpath=(//android.view.View/android.widget.ImageView[4])[1]
...    ABRIR_EN_GOOGLE_MAPS=accessibility_id=Abrir en Google Maps
&{SUCURSALES_IOS_LOCATORS}
...    INPUT_INGRESA_TU_CORREO_ELECTRONICO=xpath=(//android.widget.EditText)[1]
*** Keywords ***
_locator
    [Arguments]    ${name}
    ${is_android}=    Run Keyword And Return Status    Should Be Equal As Strings    ${PLATFORM}    Android
    IF    ${is_android}
        ${loc}=    Get From Dictionary    ${SUCURSALES_ANDROID_LOCATORS}    ${name}
    ELSE
        ${loc}=    Get From Dictionary    ${SUCURSALES_IOS_LOCATORS}    ${name}
    END
    RETURN    ${loc}
    
Y seleccionemos una sucursal
    ${BUSCAR_SUCURSAL}=    _locator    BUSCAR_SUCURSAL
    ${SELECT_SUCURSAL_CIUDAD_MEXICO}=    _locator    SELECT_SUCURSAL_CIUDAD_MEXICO
    ${SELECT_SUCURSAL}=    _locator    SELECT_SUCURSAL
    ${ABRIR_EN_GOOGLE_MAPS}=    _locator    ABRIR_EN_GOOGLE_MAPS
    Sleep    10s
    Tap    ${BUSCAR_SUCURSAL}    duration=0.3s
    Sleep    3s
    Input Text Into Current Element    Ciudad de Mexico
    Sleep    5s
    Tap    ${SELECT_SUCURSAL_CIUDAD_MEXICO}    duration=0.3s
    Sleep    3s
    Tap    ${SELECT_SUCURSAL}    duration=0.3s
    Sleep    3s
    Tap    ${ABRIR_EN_GOOGLE_MAPS}    duration=0.3s
    Sleep    3s