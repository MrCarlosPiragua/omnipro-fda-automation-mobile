*** Settings ***
Library    AppiumLibrary
Library    Collections
Library    ../../.venv/lib/python3.9/site-packages/robot/libraries/XML.py
Resource    PromocionPage.robot
Resource    ../../resources/support/actionsUtils.robot

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
...    BOTON_PROCEDER_CON_LA_ELIMINACION_SI=accessibility_id=Si
...    BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS=xpath=//android.view.View[contains(@content-desc, "Firialta 20 mg Oral")]/android.view.View[2]
...    CARRITO_DE_COMPRAS_HOME_PAGE=xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ImageView[3]
...    VACIAR_CARRITO_DE_COMPRAS=accessibility_id=Vaciar carrito de compra
...    SALIR_DE_CARRITO_DE_COMPRAS_VACIO=xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]
...    BOTON_PROCEDER_CON_EL_PAGO=accessibility_id=Proceder al pago
...    BOTON_PROCEDER_CON_EL_PAGO_SI=accessibility_id=Si
...    CONTINUAR_SIN_PROPINA=accessibility_id=Continuar sin propina
...    METODO_DE_PAGO_EFECTIVO_AL_RECIBIR=accessibility_id=Pago en Efectivo al Recibir
...    CAMBIAR_DIRECCION_ENVIO=accessibility_id=Cambiar
...    AGREGAR_METODO_DE_PAGO=accessibility_id=Añadir método de pago
...    MENU_TAP_PROMOCIONES=accessibility_id=Promociones
...    MENU_TAP_CUENTA=accessibility_id=Cuenta
...    MENU_TAP_SUCURSALES=accessibility_id=Sucursales
...    SELECCIONAR_DIRECCION_ENVIO=xpath=(//android.view.View)[6]
...    DIRECCION_OTRO=xpath=(//android.widget.ImageView)[2]
...    MENU_SELECCIONAR_CERRAR_SESION=accessibility_id=Cerrar sesión
...    MENU_SELECCIONAR_MIS_PEDIDOS=accessibility_id=Mis Pedidos
...    MENU_SELECCIONAR_CONFIGURACION=accessibility_id=Configuración
...    MENU_SELECCIONAR_CONFIGURACION_MOSTRAR_NOTIFICACIONES=accessibility_id=Mostrar Notificaciones
...    CONFIRMAR_CERRAR_SESION=accessibility_id=Sí
...    BOTON_COMPARTIR_PRODUCTO=xpath=(//android.widget.ImageView[1])[1]
...    BOTON_AGREGAR_A_LA_LISTA_DE_DESEADOS=xpath=(//android.widget.ImageView[1])[2]
...    LISTA_ARTICULOS_DESEADOS=accessibility_id=Lista de artículos deseados
...    MENU_SELECCIONAR_FAVORITOS=accessibility_id=Favoritos
...    BOTON_ELIMINAR_ITEM_2_DE_LA_LISTA_DE_DESEADOS=xpath=(//android.view.View[@content-desc="Eliminar"])[2]
...    SELECCIONAR_BANNER_DE_PROMOCIONES=xpath=//android.widget.ScrollView/android.view.View[4]/android.view.View/android.widget.ImageView
...    SELECCIONAR_BANNER_DE_PROMOCIONES_SCROLLEABLE=xpath=//android.widget.ScrollView/android.view.View[4]/android.view.View/android.widget.ImageView
...    SELECCIONAR_CATEGORIA=accessibility_id=Categoría
...    CATEGORIA_FARMACIA=accessibility_id=Farmacia
...    BOTON_VER_RESULTADOS_EN_CATEGORIA=accessibility_id=Ver resultados
...    SELECCIONAR_PRIMER_ITEM_DESPUES_DE_BUSQUEDA=xpath=(//android.view.View)[9]
...    SELECCIONAR_CATEGORIA_BEBES=accessibility_id=Bebés
...    SELECCIONAR_SUB_CATEGORIA_DE_BEBES_FORMULA_LACTEAS=accessibility_id=Fórmulas Lácteas
...    SELECCIONAR_SUB_CATEGORIA_DE_FORMULA_LACTEAS_ESPECIALIDAD=accessibility_id=Especialidad
...    BOTON_RED_SOCIAL_FACEBOOK=xpath=//android.widget.ScrollView/android.widget.ImageView[1]
...    BOTON_RED_SOCIAL_WHATSAPP=xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2]
...    NO_HAY_ARTICULOS_DISPONIBLES=xpath=//android.view.View[@content-desc="Lo sentimos, alguno de los artículos no están disponibles, favor de ajustar la cantidad en el carrito."]
...    ENVIO_A_DOMICILIO=accessibility_id=Envío a domicilio
...    CONFIRMAR_ENVIO_A_DOMICILIO=accessibility_id=Si
...    AGREGAR_UNA_DIRECCION=xpath=(//android.view.View)[11]

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
    Tap     ${CARRITO_DE_COMPRAS_HOME_PAGE}    duration=0.5s
    Sleep    5s
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${VACIAR_CARRITO_DE_COMPRAS}
    IF     ${visible} 
        Tap    ${VACIAR_CARRITO_DE_COMPRAS}    duration=0.5s
        Sleep   10s
        Tap    ${SALIR_DE_CARRITO_DE_COMPRAS_VACIO}    duration=0.5s
    ELSE
        Sleep   10s
        Tap    ${SALIR_DE_CARRITO_DE_COMPRAS_VACIO}    duration=0.5s
    END
    

Y revisemos los productos mas vendidos
    ${BOTON_VER_MAS_LO_MAS_VENEDIDO}=    _locator    BOTON_VER_MAS_LO_MAS_VENEDIDO
    Scroll Down    ${BOTON_VER_MAS_LO_MAS_VENEDIDO}
    Tap    ${BOTON_VER_MAS_LO_MAS_VENEDIDO}    duration=0.5s

Y busquemos el producto ${producto}
    ${INPUT_BUSCAR}=    _locator    INPUT_BUSCAR
    Wait Until Element Is Visible    ${INPUT_BUSCAR}    10s
    Click Element    ${INPUT_BUSCAR}
    Input Text Into Current Element    ${producto}
    Sleep    9s

Y buscamos para tener la lista de resultados
    Press Keycode    66
    Sleep    5s

Y seleccionamos el primer producto
    ${PRIMERA_SELECCION_BUSQUEDA}=    _locator    PRIMERA_SELECCION_BUSQUEDA
    Wait Until Element Is Visible    ${PRIMERA_SELECCION_BUSQUEDA}    5s
    Tap    ${PRIMERA_SELECCION_BUSQUEDA}    duration=0.5s
    Sleep    7s

Y se agregua el producto al carrito
    ${BOTON_AGREGAR_PRODUCTO_AL_CARRITO}=    _locator    BOTON_AGREGAR_PRODUCTO_AL_CARRITO
    Scroll Down    ${BOTON_AGREGAR_PRODUCTO_AL_CARRITO}
    Tap    ${BOTON_AGREGAR_PRODUCTO_AL_CARRITO}    duration=0.5s
    Sleep    5s

Y ${tipoDeAccion} el carrito de compras
    ${BOTON_CARRITO_DE_COMPRAS_CON_COMPRA}=    _locator    BOTON_CARRITO_DE_COMPRAS
    ${VACIAR_CARRITO_DE_COMPRAS}=    _locator    VACIAR_CARRITO_DE_COMPRAS
    IF    "${tipoDeAccion}" == "reviso"
        Sleep    2s
        Wait Until Element Is Visible    ${BOTON_CARRITO_DE_COMPRAS_CON_COMPRA}    10s
        Tap    ${BOTON_CARRITO_DE_COMPRAS_CON_COMPRA}    duration=0.5s
        Sleep    7s
    ELSE IF    "${tipoDeAccion}" == "limpio"
        Sleep    2s
        Tap    ${VACIAR_CARRITO_DE_COMPRAS}    duration=0.5s
        Sleep    7s
    END
    
Y al intentar editar un producto del carrito
    ${IMG_PRODUCTO_EN_CARRITO_DE_COMPRAS}=    _locator    IMG_PRODUCTO_EN_CARRITO_DE_COMPRAS
    Wait Until Element Is Visible    ${IMG_PRODUCTO_EN_CARRITO_DE_COMPRAS}    10s
    Tap    ${IMG_PRODUCTO_EN_CARRITO_DE_COMPRAS}    duration=0.5s
    Sleep    5s

Y agrego todas las unidades posibles del primer producto
    ${BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS}=    _locator    BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS
    ${NO_HAY_ARTICULOS_DISPONIBLES}=    _locator    NO_HAY_ARTICULOS_DISPONIBLES
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${NO_HAY_ARTICULOS_DISPONIBLES}
    WHILE    ${visible} == $False
        Wait Until Element Is Visible    ${BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS}    10s
        Sleep    3s
        Tap    ${BOTON_AGREGAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS}    duration=0.2s
        ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${NO_HAY_ARTICULOS_DISPONIBLES}
    END
    Sleep    10s

Y elimino una unidad del producto en el carrito
    ${BOTON_ELIMINAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS}=    _locator    BOTON_ELIMINAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS
    ${BOTON_PROCEDER_CON_LA_ELIMINACION_SI}=    _locator    BOTON_PROCEDER_CON_LA_ELIMINACION_SI
    Wait Until Element Is Visible    ${BOTON_ELIMINAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS}    10s
    Tap    ${BOTON_ELIMINAR_CANTIDAD_DE_PRODUCTO_EN_CARRITO_DE_COMPRAS}    duration=0.2s
    Sleep    3S
    Tap    ${BOTON_PROCEDER_CON_LA_ELIMINACION_SI}    duration=0.2s
    Sleep    5s

Y intento cambiar el direccion de envio
    ${CAMBIAR_DIRECCION_ENVIO}=    _locator    CAMBIAR_DIRECCION_ENVIO
    ${ENVIO_A_DOMICILIO}=    _locator    ENVIO_A_DOMICILIO
    ${CONFIRMAR_ENVIO_A_DOMICILIO}=    _locator    CONFIRMAR_ENVIO_A_DOMICILIO
    ${AGREGAR_UNA_DIRECCION}=    _locator    AGREGAR_UNA_DIRECCION
    Scroll Down    ${CAMBIAR_DIRECCION_ENVIO}
    Tap    ${CAMBIAR_DIRECCION_ENVIO}    duration=0.5s
    Sleep    3s
    Tap    ${ENVIO_A_DOMICILIO}    duration=0.5s
    Sleep    3s
    Tap    ${CONFIRMAR_ENVIO_A_DOMICILIO}    duration=0.5s
    Sleep    3s
    Tap    ${AGREGAR_UNA_DIRECCION}    duration=0.5s
    Sleep    3s

Y procedemos con el pago
    ${BOTON_PROCEDER_CON_EL_PAGO}=    _locator    BOTON_PROCEDER_CON_EL_PAGO
    ${BOTON_PROCEDER_CON_EL_PAGO_SI}=    _locator    BOTON_PROCEDER_CON_EL_PAGO_SI
    Sleep    5s
    Tap    ${BOTON_PROCEDER_CON_EL_PAGO}    duration=0.2s
    Sleep    5s
    Tap    ${BOTON_PROCEDER_CON_EL_PAGO_SI}    duration=0.2s

Y agregamos otro metodo de pago
    ${AGREGAR_METODO_DE_PAGO}=    _locator    AGREGAR_METODO_DE_PAGO
    Sleep    7s
    Wait Until Element Is Visible    ${AGREGAR_METODO_DE_PAGO}    10s
    Tap    ${AGREGAR_METODO_DE_PAGO}    duration=0.5s
    Sleep    5s

Y naveguemos al menu de ${tapEnElMenu}
    IF    "${tapEnElMenu}" == "Promociones"
        ${MENU_TAP_PROMOCIONES}=    _locator    MENU_TAP_PROMOCIONES
        Wait Until Element Is Visible    ${MENU_TAP_PROMOCIONES}    5s
        Tap    ${MENU_TAP_PROMOCIONES}    duration=0.5s
    ELSE IF    "${tapEnElMenu}" == "Cuenta"
        ${MENU_TAP_CUENTA}=    _locator    MENU_TAP_CUENTA
        Wait Until Element Is Visible    ${MENU_TAP_CUENTA}    5s
        Tap    ${MENU_TAP_CUENTA}    duration=0.5s
    ELSE IF    "${tapEnElMenu}" == "Sucursales"
        ${MENU_TAP_SUCURSALES}=    _locator    MENU_TAP_SUCURSALES
        Wait Until Element Is Visible    ${MENU_TAP_SUCURSALES}    5s
        Tap    ${MENU_TAP_SUCURSALES}    duration=0.5s
    END

Y intentemos seleccionar una direccion de envio
    ${SELECCIONAR_DIRECCION_ENVIO}=    _locator    SELECCIONAR_DIRECCION_ENVIO
    Wait Until Element Is Visible    ${SELECCIONAR_DIRECCION_ENVIO}    10s
    Tap    ${SELECCIONAR_DIRECCION_ENVIO}    duration=0.5s
    Sleep    2s

Y seleccionamos la otra direccion 
    ${DIRECCION_OTRO}=    _locator    DIRECCION_OTRO
    Wait Until Element Is Visible    ${DIRECCION_OTRO}    10s
    Tap    ${DIRECCION_OTRO}    duration=0.5s
    Sleep    2s

Y vamos a la seccion de ${tapCuentaMenu}
    IF    "${tapCuentaMenu}" == "Cerrar Sesion"
        ${MENU_SELECCIONAR_CERRAR_SESION}=    _locator    MENU_SELECCIONAR_CERRAR_SESION
        Wait Until Element Is Visible    ${MENU_SELECCIONAR_CERRAR_SESION}    5s
        Tap    ${MENU_SELECCIONAR_CERRAR_SESION}    duration=0.5s
        Sleep    2s
    ELSE IF    "${tapCuentaMenu}" == "Mis Pedidos"
        ${MENU_SELECCIONAR_MIS_PEDIDOS}=    _locator    MENU_SELECCIONAR_MIS_PEDIDOS
        Wait Until Element Is Visible    ${MENU_SELECCIONAR_MIS_PEDIDOS}    5s
        Tap    ${MENU_SELECCIONAR_MIS_PEDIDOS}    duration=0.5s
        Sleep    2s
    ELSE IF    "${tapCuentaMenu}" == "Configuracion"
        ${MENU_SELECCIONAR_CONFIGURACION}=    _locator    MENU_SELECCIONAR_CONFIGURACION
        Wait Until Element Is Visible    ${MENU_SELECCIONAR_CONFIGURACION}    5s
        Tap    ${MENU_SELECCIONAR_CONFIGURACION}    duration=0.5s
        Sleep    2s
    END
    
Y procedemos a cerrar sesion
    ${CONFIRMAR_CERRAR_SESION}=    _locator    CONFIRMAR_CERRAR_SESION
    Wait Until Element Is Visible    ${CONFIRMAR_CERRAR_SESION}    5s
    Tap    ${CONFIRMAR_CERRAR_SESION}    duration=0.5s
    Sleep    2s

Y compartimos el producto
    ${BOTON_COMPARTIR_PRODUCTO}=    _locator    BOTON_COMPARTIR_PRODUCTO
    Wait Until Element Is Visible    ${BOTON_COMPARTIR_PRODUCTO}    5s
    Tap    ${BOTON_COMPARTIR_PRODUCTO}    duration=0.5s
    Sleep    2s

Y agregamos un producto a la lista de deseados
    ${BOTON_AGREGAR_A_LA_LISTA_DE_DESEADOS}=    _locator    BOTON_AGREGAR_A_LA_LISTA_DE_DESEADOS
    ${LISTA_ARTICULOS_DESEADOS}=    _locator    LISTA_ARTICULOS_DESEADOS
    Sleep    5s
    Tap    ${BOTON_AGREGAR_A_LA_LISTA_DE_DESEADOS}    duration=0.5s
    Sleep    2s
    Tap    ${LISTA_ARTICULOS_DESEADOS}    duration=0.5s
    Sleep    8s

Y lo eliminamos de la lista de deseados
    ${MENU_TAP_CUENTA}=    _locator    MENU_TAP_CUENTA
    ${MENU_SELECCIONAR_FAVORITOS}=    _locator    MENU_SELECCIONAR_FAVORITOS
    ${BOTON_ELIMINAR_ITEM_2_DE_LA_LISTA_DE_DESEADOS}=    _locator    BOTON_ELIMINAR_ITEM_2_DE_LA_LISTA_DE_DESEADOS
    Wait Until Element Is Visible    ${MENU_TAP_CUENTA}    5s
    Tap    ${MENU_TAP_CUENTA}    duration=0.5s
    Wait Until Element Is Visible    ${MENU_SELECCIONAR_FAVORITOS}    5s
    Tap    ${MENU_SELECCIONAR_FAVORITOS}    duration=0.5s
    Wait Until Element Is Visible    ${BOTON_ELIMINAR_ITEM_2_DE_LA_LISTA_DE_DESEADOS}    5s
    Tap    ${BOTON_ELIMINAR_ITEM_2_DE_LA_LISTA_DE_DESEADOS}    duration=0.5s
    Sleep    8s

Y continuamos sin propina si se solicita
    ${CONTINUAR_SIN_PROPINA}=    _locator    CONTINUAR_SIN_PROPINA
    Sleep    7s
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${CONTINUAR_SIN_PROPINA}
    IF     ${visible} 
        Tap    ${CONTINUAR_SIN_PROPINA}    duration=0.2s
    END

Y seleccionemos un banner de promociones
    ${SELECCIONAR_BANNER_DE_PROMOCIONES}=    _locator    SELECCIONAR_BANNER_DE_PROMOCIONES
    ${SELECCIONAR_BANNER_DE_PROMOCIONES_SCROLLEABLE}=    _locator    SELECCIONAR_BANNER_DE_PROMOCIONES_SCROLLEABLE
    Scroll Down    ${SELECCIONAR_BANNER_DE_PROMOCIONES_SCROLLEABLE}
    Wait Until Element Is Visible    ${SELECCIONAR_BANNER_DE_PROMOCIONES}    40s
    Sleep    2s
    Tap    ${SELECCIONAR_BANNER_DE_PROMOCIONES}    duration=0.3s
    Sleep    2s

Y seleccionamos una categoria para filtro
    ${SELECCIONAR_CATEGORIA}=    _locator    SELECCIONAR_CATEGORIA
    ${CATEGORIA_FARMACIA}=    _locator    CATEGORIA_FARMACIA
    ${BOTON_VER_RESULTADOS_EN_CATEGORIA}=    _locator    BOTON_VER_RESULTADOS_EN_CATEGORIA
    Sleep    2s
    Tap    ${SELECCIONAR_CATEGORIA}    duration=0.2s
    Sleep    2s
    Tap    ${CATEGORIA_FARMACIA}    duration=0.2s
    Sleep    2s
    Tap    ${BOTON_VER_RESULTADOS_EN_CATEGORIA}    duration=0.2s
    Sleep    5s

Y seleccionamos el primer resultado
    ${SELECCIONAR_PRIMER_ITEM_DESPUES_DE_BUSQUEDA}=    _locator    SELECCIONAR_PRIMER_ITEM_DESPUES_DE_BUSQUEDA
    Wait Until Element Is Visible    ${SELECCIONAR_PRIMER_ITEM_DESPUES_DE_BUSQUEDA}    5s
    Tap    ${SELECCIONAR_PRIMER_ITEM_DESPUES_DE_BUSQUEDA}    duration=0.5s
    Sleep    5s

Y seleccionamos la categoria ${categoria}
    IF    "${categoria}" == "Bebes"
        ${SELECCIONAR_CATEGORIA_BEBES}=    _locator    SELECCIONAR_CATEGORIA_BEBES
        ${SELECCIONAR_SUB_CATEGORIA_DE_BEBES_FORMULA_LACTEAS}=    _locator    SELECCIONAR_SUB_CATEGORIA_DE_BEBES_FORMULA_LACTEAS
        ${SELECCIONAR_SUB_CATEGORIA_DE_FORMULA_LACTEAS_ESPECIALIDAD}=    _locator    SELECCIONAR_SUB_CATEGORIA_DE_FORMULA_LACTEAS_ESPECIALIDAD
        Wait Until Element Is Visible    ${SELECCIONAR_CATEGORIA_BEBES}    15s
        Sleep    2s
        Tap    ${SELECCIONAR_CATEGORIA_BEBES}    duration=0.5s
        Wait Until Element Is Visible    ${SELECCIONAR_SUB_CATEGORIA_DE_BEBES_FORMULA_LACTEAS}    15s
        Sleep    2s
        Tap    ${SELECCIONAR_SUB_CATEGORIA_DE_BEBES_FORMULA_LACTEAS}    duration=0.5s
        Wait Until Element Is Visible    ${SELECCIONAR_SUB_CATEGORIA_DE_BEBES_FORMULA_LACTEAS}    15s
        Sleep    2s
        Tap    ${SELECCIONAR_SUB_CATEGORIA_DE_FORMULA_LACTEAS_ESPECIALIDAD}    duration=0.5s
        Sleep    5s
    END

Y demos click en la red social de ${redSocial}
    IF    "${redSocial}" == "Facebook"
        ${BOTON_RED_SOCIAL_FACEBOOK}=    _locator    BOTON_RED_SOCIAL_FACEBOOK
        Scroll Hasta El Final
        Sleep    2s
        Tap    ${BOTON_RED_SOCIAL_FACEBOOK}    duration=0.3s
        Sleep    5s
    ELSE IF   "${redSocial}" == "WhatsApp"
        ${BOTON_RED_SOCIAL_WHATSAPP}=    _locator    BOTON_RED_SOCIAL_WHATSAPP
        Sleep    3s
        Tap    ${BOTON_RED_SOCIAL_WHATSAPP}    duration=0.3s
        Sleep    5s
    END