*** Settings ***
Library    AppiumLibrary
Library    Collections
Resource    PromocionPage.robot

*** Variables ***
&{HOME_ANDROID_LOCATORS}
...    BOTON_VER_MAS_LO_MAS_VENEDIDO=xpath=(//android.view.View[@content-desc='Ver mas'])[1]
...    INPUT_BUSCAR=xpath=//android.widget.EditText
...    PRIMERA_SELECCION_BUSQUEDA=xpath=(//android.widget.ImageView)[1]
...    TITULO_DE_SELECCION=xpath=//android.view.View[@content-desc="Firialta 20 mg Oral 28 Tabs"]
...    BOTON_AGREGAR_PRODUCTO_AL_CARRITO=xpath=//android.widget.Button[@content-desc="Agregar al carrito"]
...    BOTON_CARRITO_DE_COMPRAS=xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ImageView[3]
...    BOTON_CARRITO_DE_COMPRAS_CON_COMPRA=xpath=(//android.view.View[@content-desc="1"])[1]/android.widget.ImageView[3]
...    IMG_PRODUCTO_EN_CARRITO_DE_COMPRAS=xpath=(//android.view.View/android.widget.ImageView[1])[1]
...    BOTON_ELIMINAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS=xpath=(//android.view.View/android.view.View[1])[9]
...    BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS=xpath=(//android.view.View/android.view.View[2])[3]
...    CARRITO_DE_COMPRAS_HOME_PAGE=xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ImageView[3]
...    VACIAR_CARRITO_DE_COMPRAS=accessibility_id=Vaciar carrito de compra
...    SALIR_DE_CARRITO_DE_COMPRAS_VACIO=xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]
...    BOTON_PROCEDER_CON_EL_PAGO=accessibility_id=Proceder al pago
...    BOTON_PROCEDER_CON_EL_PAGO_SI=accessibility_id=Si
...    PAGO_EFECTIVO_AL_RECIBIR=accessibility_id=Pago en Efectivo al Recibir
...    CAMBIAR_DIRECCION_ENVIO=accessibility_id=Cambiar
...    AGREGAR_METODO_DE_PAGO=accessibility_id=Añadir método de pago
...    SERVICIO_ORIENTACION_MEDICA=accessibility_id=Orientación Médica Gratuita
...    SERVICIO_DERMA_SCAN=accessibility_id=DermaScan
...    MEDICO_SUCURSAL=accessibility_id=Médico en Sucursal
...    MENU_TAP_PROMOCIONES=accessibility_id=Promociones
...    MENU_TAP_CUENTA=accessibility_id=Cuenta
...    SELECCIONAR_DIRECCION_ENVIO=xpath=(//android.view.View)[6]
...    DIRECCION_OTRO=xpath=(//android.widget.ImageView)[2]
...    MENU_TAP_CUENTA=accessibility_id=Cuenta
...    MENU_TAP_CERRAR_SESION=accessibility_id=Cerrar sesión
...    CONFIRMAR_CERRAR_SESION=accessibility_id=Sí

&{HOME_IOS_LOCATORS}

*** Keywords ***
_locator
    [Arguments]    ${name}
    ${is_android}=    Run Keyword And Return Status    Should Be Equal As Strings    ${PLATFORM}    Android
    IF    ${is_android}
        ${loc}=    Get From Dictionary    ${HOME_ANDROID_LOCATORS}    ${name}
    ELSE
        ${loc}=    Get From Dictionary    ${HOME_IOS_LOCATORS}    ${name}
    END
    RETURN    ${loc}

Y valido que no hayan productos en el carrito
    ${CARRITO_DE_COMPRAS_HOME_PAGE}=    _locator    CARRITO_DE_COMPRAS_HOME_PAGE
    ${VACIAR_CARRITO_DE_COMPRAS}=    _locator    VACIAR_CARRITO_DE_COMPRAS
    ${SALIR_DE_CARRITO_DE_COMPRAS_VACIO}=    _locator    SALIR_DE_CARRITO_DE_COMPRAS_VACIO
    Wait Until Element Is Visible    ${CARRITO_DE_COMPRAS_HOME_PAGE}    10s
    Click Element    ${CARRITO_DE_COMPRAS_HOME_PAGE}
    Sleep    5s
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${VACIAR_CARRITO_DE_COMPRAS}
    IF     ${visible} 
        Click Element    ${VACIAR_CARRITO_DE_COMPRAS}
        Wait Until Element Is Visible    ${SALIR_DE_CARRITO_DE_COMPRAS_VACIO}    10s
        Click Element    ${SALIR_DE_CARRITO_DE_COMPRAS_VACIO}
    ELSE
        Wait Until Element Is Visible    ${SALIR_DE_CARRITO_DE_COMPRAS_VACIO}    10s
        Click Element    ${SALIR_DE_CARRITO_DE_COMPRAS_VACIO}
    END
    

Y revisemos los productos mas vendidos
    ${BOTON_VER_MAS_LO_MAS_VENEDIDO}=    _locator    BOTON_VER_MAS_LO_MAS_VENEDIDO
    Scroll Down    ${BOTON_VER_MAS_LO_MAS_VENEDIDO}
    Click Element    ${BOTON_VER_MAS_LO_MAS_VENEDIDO}

Y busquemos el producto ${producto}
    ${INPUT_BUSCAR}=    _locator    INPUT_BUSCAR
    Click Element    ${INPUT_BUSCAR}
    Input Text    ${INPUT_BUSCAR}    ${producto}
    Sleep    5s
    

Y seleccionamos el primer producto
    ${PRIMERA_SELECCION_BUSQUEDA}=    _locator    PRIMERA_SELECCION_BUSQUEDA
    Wait Until Element Is Visible    ${PRIMERA_SELECCION_BUSQUEDA}    5s
    Click Element    ${PRIMERA_SELECCION_BUSQUEDA}

Y se agregua el producto al carrito
    ${BOTON_AGREGAR_PRODUCTO_AL_CARRITO}=    _locator    BOTON_AGREGAR_PRODUCTO_AL_CARRITO
    Sleep    5s
    Scroll Down    ${BOTON_AGREGAR_PRODUCTO_AL_CARRITO}
    Click Element    ${BOTON_AGREGAR_PRODUCTO_AL_CARRITO}

Y reviso el carrito de compras
    ${BOTON_CARRITO_DE_COMPRAS_CON_COMPRA}=    _locator    BOTON_CARRITO_DE_COMPRAS
    Wait Until Element Is Visible    ${BOTON_CARRITO_DE_COMPRAS_CON_COMPRA}    10s
    Click Element    ${BOTON_CARRITO_DE_COMPRAS_CON_COMPRA}

Y al intentar editar un producto del carrito
    ${IMG_PRODUCTO_EN_CARRITO_DE_COMPRAS}=    _locator    IMG_PRODUCTO_EN_CARRITO_DE_COMPRAS
    Wait Until Element Is Visible    ${IMG_PRODUCTO_EN_CARRITO_DE_COMPRAS}    10s
    Click Element    ${IMG_PRODUCTO_EN_CARRITO_DE_COMPRAS}

Y agrego ${cantidad} unidades mas del producto
    ${BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS}=    _locator    BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS
    FOR    ${i}    IN RANGE    ${cantidad}
        Wait Until Element Is Visible    ${BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS}    10s
        Click Element    ${BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS} 
    END
    Sleep    10s

Y intento cambiar el direccion de envio
    ${CAMBIAR_DIRECCION_ENVIO}=    _locator    CAMBIAR_DIRECCION_ENVIO
    Scroll Down    ${CAMBIAR_DIRECCION_ENVIO}
    Click Element    ${CAMBIAR_DIRECCION_ENVIO}

Y procedemos con el pago
    ${BOTON_PROCEDER_CON_EL_PAGO}=    _locator    BOTON_PROCEDER_CON_EL_PAGO
    ${BOTON_PROCEDER_CON_EL_PAGO_SI}=    _locator    BOTON_PROCEDER_CON_EL_PAGO_SI
    Sleep    5s
    Click Element    ${BOTON_PROCEDER_CON_EL_PAGO}
    Sleep    5s
    Click Element    ${BOTON_PROCEDER_CON_EL_PAGO_SI}

Y agregamos otro metodo de pago
    ${AGREGAR_METODO_DE_PAGO}=    _locator    AGREGAR_METODO_DE_PAGO
    Wait Until Element Is Visible    ${AGREGAR_METODO_DE_PAGO}    10s
    Click Element    ${AGREGAR_METODO_DE_PAGO}

 Y seleccionamos el servicio de Orientacion medica
    ${SERVICIO_ORIENTACION_MEDICA}=    _locator    SERVICIO_ORIENTACION_MEDICA
    ${MEDICO_SUCURSAL}=    _locator    MEDICO_SUCURSAL
    Scroll Down    ${SERVICIO_ORIENTACION_MEDICA}
    Sleep    1s
    Tap    ${SERVICIO_ORIENTACION_MEDICA}
    Sleep    2s
    Tap    ${MEDICO_SUCURSAL}
    Sleep    5s


Y naveguemos al menu de ${tapEnElMenu}
    IF    "${tapEnElMenu}" == "Promociones"
        ${MENU_TAP_PROMOCIONES}=    _locator    MENU_TAP_PROMOCIONES
        Wait Until Element Is Visible    ${MENU_TAP_PROMOCIONES}    5s
        Tap    ${MENU_TAP_PROMOCIONES}
    ELSE IF    "${tapEnElMenu}" == "Cuenta"
        ${MENU_TAP_CUENTA}=    _locator    MENU_TAP_CUENTA
        Wait Until Element Is Visible    ${MENU_TAP_CUENTA}    5s
        Tap    ${MENU_TAP_CUENTA}
    END


Y intentemos seleccionar una direccion de envio
    ${SELECCIONAR_DIRECCION_ENVIO}=    _locator    SELECCIONAR_DIRECCION_ENVIO
    Wait Until Element Is Visible    ${SELECCIONAR_DIRECCION_ENVIO}    10s
    Click Element    ${SELECCIONAR_DIRECCION_ENVIO}

Y seleccionamos la direccion Otro
    ${DIRECCION_OTRO}=    _locator    DIRECCION_OTRO
    Wait Until Element Is Visible    ${DIRECCION_OTRO}    10s
    Click Element    ${DIRECCION_OTRO}

Y vamos a la seccion de ${tapCuentaMenu}
    IF    "${tapCuentaMenu}" == "Cerrar Sesion"
        ${MENU_TAP_CERRAR_SESION}=    _locator    MENU_TAP_CERRAR_SESION
        Wait Until Element Is Visible    ${MENU_TAP_CERRAR_SESION}    5s
        Tap    ${MENU_TAP_CERRAR_SESION}
    END
    
Y procedemos a cerrar sesion
    ${CONFIRMAR_CERRAR_SESION}=    _locator    CONFIRMAR_CERRAR_SESION
    Wait Until Element Is Visible    ${CONFIRMAR_CERRAR_SESION}    5s
    Tap    ${CONFIRMAR_CERRAR_SESION}

Y entremos al servicio de ${servicioAEscoger}
    IF    "${servicioAEscoger}" == "DermaScan"
        ${SERVICIO_DERMA_SCAN}=    _locator    SERVICIO_DERMA_SCAN
        Scroll Down    ${SERVICIO_DERMA_SCAN}
        Sleep    3s
        Tap    ${SERVICIO_DERMA_SCAN}
    END