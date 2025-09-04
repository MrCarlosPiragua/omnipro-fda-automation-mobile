*** Settings ***
Library    AppiumLibrary
Library    Collections
Resource    PromocionPage.robot

*** Variables ***
&{LOGIN_ANDROID_LOCATORS}
...    INPUT_INGRESA_TU_CORREO_ELECTRONICO=xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.EditText
...    INPUT_INGRESA_TU_CONTRASENA=xpath=//android.widget.ScrollView/android.view.View[4]/android.widget.EditText
...    BOTON_INICIAR_SESION=xpath=(//android.widget.Button)[1]
...    BOTON_OMITIR=accessibility_id=Omitir
...    RECUPERAR_CONTRASENA=accessibility_id=Olvidé mi contraseña
...    CREAR_UNA_CUENTA=accessibility_id=Crea una cuenta\n>
...    INPUT_NOMBRE=xpath=//android.widget.ScrollView/android.view.View[3]/android.widget.EditText
...    INPUT_APELLIDO=xpath=//android.widget.ScrollView/android.view.View[4]/android.widget.EditText
...    INPUT_NUMERO_DE_CELULAR=xpath=//android.widget.ScrollView/android.view.View[9]/android.widget.EditText
...    INPUT_FECHA_DE_NACIMIENTO=xpath=//android.widget.ScrollView/android.view.View[10]
...    SELECCION_DE_FECHA=accessibility_id=ACEPTAR
...    INPUT_CORREO_ELECTRONICO=xpath=//android.widget.ScrollView/android.view.View[12]/android.widget.EditText
...    INPUT_CONTRASENA=xpath=//android.widget.ScrollView/android.view.View[14]/android.widget.EditText
...    INPUT_CONFIRMAR_CONTRASENA=xpath=//android.widget.ScrollView/android.view.View[16]/android.widget.EditText
...    BOTON_CREAR_CUENTA=accessibility_id=Crea una cuenta
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
    Tap    ${BOTON_OMITIR}    duration=0.5s

Cuando hagamos login en el aplicativo
    ${BOTON_INICIAR_SESION}=    _locator    BOTON_INICIAR_SESION
    ${INPUT_INGRESA_TU_CORREO_ELECTRONICO}=    _locator    INPUT_INGRESA_TU_CORREO_ELECTRONICO
    ${INPUT_INGRESA_TU_CONTRASENA}=    _locator    INPUT_INGRESA_TU_CONTRASENA
    Wait Until Element Is Visible    ${BOTON_INICIAR_SESION}    5s
    Tap    ${INPUT_INGRESA_TU_CORREO_ELECTRONICO}    duration=0.3s
    Input Text Into Current Element    ${EMAIL}
    Tap    ${INPUT_INGRESA_TU_CONTRASENA}    duration=0.3s
    Input Text Into Current Element    ${PASSWORD}
    Tap    ${BOTON_INICIAR_SESION}    duration=0.3s
    Sleep    5s

Cuando intentemos recuperar contrasena
    ${RECUPERAR_CONTRASENA}=    _locator    RECUPERAR_CONTRASENA
    Wait Until Element Is Visible    ${RECUPERAR_CONTRASENA}    5s
    Tap    ${RECUPERAR_CONTRASENA}    duration=0.5s
    Sleep    2s

Cuando intentemos crear una nueva cuenta
    Sleep    2s
    ${CREAR_UNA_CUENTA}=    _locator    CREAR_UNA_CUENTA
    Wait Until Element Is Visible    ${CREAR_UNA_CUENTA}    5s
    Click Element    ${CREAR_UNA_CUENTA}
    Sleep    2s

Y con tipo de creacion ${tipoDeCreacion}
    ${INPUT_NOMBRE}=    _locator    INPUT_NOMBRE
    ${INPUT_APELLIDO}=    _locator    INPUT_APELLIDO
    ${INPUT_NUMERO_DE_CELULAR}=    _locator    INPUT_NUMERO_DE_CELULAR
    ${INPUT_FECHA_DE_NACIMIENTO}=    _locator    INPUT_FECHA_DE_NACIMIENTO
    ${SELECCION_DE_FECHA}=    _locator    SELECCION_DE_FECHA
    ${INPUT_CORREO_ELECTRONICO}=    _locator    INPUT_CORREO_ELECTRONICO
    ${INPUT_CONTRASENA}=    _locator    INPUT_CONTRASENA
    ${INPUT_CONFIRMAR_CONTRASENA}=    _locator    INPUT_CONFIRMAR_CONTRASENA
    ${BOTON_CREAR_CUENTA}=    _locator    BOTON_CREAR_CUENTA
    IF    "${tipoDeCreacion}" == "contrasena incorrecta"
        Sleep    3s
        Tap    ${INPUT_NOMBRE}    duration=0.3s
        Input Text Into Current Element    Carlos
        Sleep    1s
        Tap    ${INPUT_APELLIDO}    duration=0.3s
        Input Text Into Current Element    Piragua
        Sleep    1s
        Tap    ${INPUT_NUMERO_DE_CELULAR}    duration=0.3s
        Input Text Into Current Element    123asd85769
        Sleep    2s
        Tap    ${INPUT_FECHA_DE_NACIMIENTO}    duration=0.3s
        Sleep    2s
        Tap    ${SELECCION_DE_FECHA}    duration=0.3s
        Sleep    3s
    ELSE IF    "${tipoDeCreacion}" == "correo existente"
        Sleep    3s
        Tap    ${INPUT_NOMBRE}    duration=0.3s
        Input Text Into Current Element    Carlos
        Sleep    2s
        Tap    ${INPUT_APELLIDO}    duration=0.3s
        Input Text Into Current Element    Piragua
        Sleep    2s
        Tap    ${INPUT_NUMERO_DE_CELULAR}    duration=0.3s
        Input Text Into Current Element    1234985769
        Sleep    2s
        Tap    ${INPUT_FECHA_DE_NACIMIENTO}    duration=0.3s
        Sleep    3s
        Tap    ${SELECCION_DE_FECHA}    duration=0.3s
        Sleep    3s
        Tap    ${INPUT_CORREO_ELECTRONICO}    duration=0.3s
        Input Text Into Current Element    carlos.test.fda@yopmail.com
        Press Keycode    \13
        Sleep    4s
        Tap    ${INPUT_CONTRASENA}    duration=0.3s
        Input Text Into Current Element    Omnipro2025*
        Sleep    2s
        Tap    ${INPUT_CONFIRMAR_CONTRASENA}    duration=0.3s
        Input Text Into Current Element    Omnipro2025*
        Sleep    2s
        Tap    ${BOTON_CREAR_CUENTA}    duration=0.3s
        Sleep    5s
    END
