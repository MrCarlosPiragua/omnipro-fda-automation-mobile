*** Settings ***
Library    AppiumLibrary
Library    Collections

*** Variables ***
&{LOGIN_ANDROID_LOCATORS}
...    INPUT_INGRESA_TU_CORREO_ELECTRONICO=xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.EditText
...    INPUT_INGRESA_TU_CORREO_ELECTRONICO1=xpath=//android.widget.ScrollView/android.view.View[2]/android.widget.EditText
...    INPUT_INGRESA_TU_CONTRASENA=xpath=//android.widget.ScrollView/android.view.View[4]/android.widget.EditText
...    BOTON_INICIAR_SESION=xpath=(//android.widget.Button)[1]
...    BOTON_OMITIR=accessibility_id=Omitir
...    RECUPERAR_CONTRASENA=accessibility_id=Olvidé mi contraseña
...    CREAR_UNA_CUENTA=accessibility_id=Crea una cuenta\n>
&{LOGIN_IOS_LOCATORS}
...    INPUT_INGRESA_TU_CORREO_ELECTRONICO=xpath=(//android.widget.EditText)[1]
*** Keywords ***
_locator
    [Arguments]    ${name}
    ${is_android}=    Run Keyword And Return Status    Should Be Equal As Strings    ${PLATFORM}    Android
    IF    ${is_android}
        ${loc}=    Get From Dictionary    ${LOGIN_ANDROID_LOCATORS}    ${name}
    ELSE
        ${loc}=    Get From Dictionary    ${LOGIN_IOS_LOCATORS}    ${name}
    END
    RETURN    ${loc}
    
Cuando omitiamos el inicio de sesion
    ${BOTON_OMITIR}=    _locator    BOTON_OMITIR
    Wait Until Element Is Visible    ${BOTON_OMITIR}    5s
    Click Element    ${BOTON_OMITIR}

Cuando hagamos login en el aplicativo
    ${BOTON_INICIAR_SESION}=    _locator    BOTON_INICIAR_SESION
    ${INPUT_INGRESA_TU_CORREO_ELECTRONICO}=    _locator    INPUT_INGRESA_TU_CORREO_ELECTRONICO
    ${INPUT_INGRESA_TU_CORREO_ELECTRONICO1}=    _locator    INPUT_INGRESA_TU_CORREO_ELECTRONICO1
    ${INPUT_INGRESA_TU_CONTRASENA}=    _locator    INPUT_INGRESA_TU_CONTRASENA
    Wait Until Element Is Visible    ${BOTON_INICIAR_SESION}    5s
    Click Element    ${INPUT_INGRESA_TU_CORREO_ELECTRONICO}
    Input Text    ${INPUT_INGRESA_TU_CORREO_ELECTRONICO1}    ${EMAIL}
    Click Element    ${INPUT_INGRESA_TU_CONTRASENA}
    Input Text    ${INPUT_INGRESA_TU_CONTRASENA}    ${PASSWORD}
    Click Element    ${BOTON_INICIAR_SESION}

Cuando intentemos recuperar contrasena
    ${RECUPERAR_CONTRASENA}=    _locator    RECUPERAR_CONTRASENA
    Wait Until Element Is Visible    ${RECUPERAR_CONTRASENA}    5s
    Tap    ${RECUPERAR_CONTRASENA}
    Sleep    2s

Cuando intentemos crear una nueva cuenta
    ${CREAR_UNA_CUENTA}=    _locator    CREAR_UNA_CUENTA
    Wait Until Element Is Visible    ${CREAR_UNA_CUENTA}    5s
    Click Element    ${CREAR_UNA_CUENTA}
    Sleep    2s