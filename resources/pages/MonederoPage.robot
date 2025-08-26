*** Settings ***
Library    AppiumLibrary
Library    Collections
Resource    PromocionPage.robot

*** Variables ***
&{MONEDERO_ANDROID_LOCATORS}
...    SECCION_MONEDERO_DEL_AHORRO=accessibility_id=0
...    OBTENER_MONEDERO=accessibility_id=Obtener Monedero
...    EN_OTRO_MOMENTO=accessibility_id=En otro momento
...    ELIMINAR_MONEDERO=accessibility_id=Eliminar Monedero del Ahorro
...    VER_MI_ESTADO_DE_CUENTA=accessibility_id=Ver mi Estado de Cuenta
...    CONFIRMAR_ELIMINACION_MONEDERO=accessibility_id=Confirmar
...    INPUT_NUMERO_DE_MONEDERO_DEL_AHORRO=xpath=//android.widget.EditText
...    BOTON_AGREGAR_MONEDERO_DEL_AHORRO=accessibility_id=Agregar Monedero del Ahorro
...    BOTON_ENTERADO=accessibility_id=Enterado
...    BOTON_ATRAS=xpath=//android.widget.Button

&{MONEDERO_IOS_LOCATORS}

*** Keywords ***
_locator
    [Arguments]    ${name}
    ${is_android}=    Run Keyword And Return Status    Should Be Equal As Strings    ${PLATFORM}    Android
    IF    ${is_android}
        ${loc}=    Get From Dictionary    ${MONEDERO_ANDROID_LOCATORS}    ${name}
    ELSE
        ${loc}=    Get From Dictionary    ${MONEDERO_IOS_LOCATORS}    ${name}
    END
    RETURN    ${loc}

Y entramos a la seccion de monedero del ahorro
     ${SECCION_MONEDERO_DEL_AHORRO}=    _locator    SECCION_MONEDERO_DEL_AHORRO
    Wait Until Element Is Visible    ${SECCION_MONEDERO_DEL_AHORRO}    5s
    Tap    ${SECCION_MONEDERO_DEL_AHORRO}

Y en la seccion monedero damos tap en ${obtenerMonedero}
    IF    "${obtenerMonedero}" == "Obtener Monedero"
        ${OBTENER_MONEDERO}=    _locator    OBTENER_MONEDERO
        Wait Until Element Is Visible    ${OBTENER_MONEDERO}    5s
        Tap    ${OBTENER_MONEDERO}
    ELSE IF    "${obtenerMonedero}" == "En otro momento"
        ${EN_OTRO_MOMENTO}=    _locator    EN_OTRO_MOMENTO
        Wait Until Element Is Visible    ${EN_OTRO_MOMENTO}    5s
        Tap    ${EN_OTRO_MOMENTO}
    END

Y iniciamos en el monedero ${monederoId}
    ${INPUT_NUMERO_DE_MONEDERO_DEL_AHORRO}=    _locator    INPUT_NUMERO_DE_MONEDERO_DEL_AHORRO
    ${BOTON_AGREGAR_MONEDERO_DEL_AHORRO}=    _locator    BOTON_AGREGAR_MONEDERO_DEL_AHORRO
    ${BOTON_ENTERADO}=    _locator    BOTON_ENTERADO
    Wait Until Element Is Visible    ${INPUT_NUMERO_DE_MONEDERO_DEL_AHORRO}    10s
    Tap    ${INPUT_NUMERO_DE_MONEDERO_DEL_AHORRO}
    Sleep    1s
    Input Text    ${INPUT_NUMERO_DE_MONEDERO_DEL_AHORRO}    ${monederoId}
    Sleep    2s
    Tap    ${INPUT_NUMERO_DE_MONEDERO_DEL_AHORRO}
    Sleep    1s
    Tap    ${BOTON_AGREGAR_MONEDERO_DEL_AHORRO}
    Sleep    5s
    Tap    ${BOTON_ENTERADO}
    Sleep    8s
    Tap Por Porcentaje
    Sleep    5s
    Tap Por Porcentaje


Y eliminamos el monedero
    ${ELIMINAR_MONEDERO}=    _locator    ELIMINAR_MONEDERO
    ${CONFIRMAR_ELIMINACION_MONEDERO}=    _locator    CONFIRMAR_ELIMINACION_MONEDERO
    Wait Until Element Is Visible    ${ELIMINAR_MONEDERO}    10s
    Tap    ${ELIMINAR_MONEDERO}
    Wait Until Element Is Visible    ${CONFIRMAR_ELIMINACION_MONEDERO}    10s
    Tap    ${CONFIRMAR_ELIMINACION_MONEDERO}
    Sleep    15s

Y vemos el estado de cuenta
    ${VER_MI_ESTADO_DE_CUENTA}=    _locator    VER_MI_ESTADO_DE_CUENTA
    ${BOTON_ATRAS}=    _locator    BOTON_ATRAS
    Wait Until Element Is Visible    ${VER_MI_ESTADO_DE_CUENTA}    10s
    Tap    ${VER_MI_ESTADO_DE_CUENTA}
    Sleep    4s
    Tap    ${BOTON_ATRAS}