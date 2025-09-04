*** Settings ***
Resource    ../../resources/support/app.robot
Resource    ../../resources/pages/OnboardingPage.robot
Resource    ../../resources/pages/LoginPage.robot
Resource    ../../resources/pages/PromocionPage.robot
Resource    ../../resources/pages/MainPage.robot
Resource    ../../resources/pages/MonederoPage.robot
Resource    ../../resources/pages/SucursalesPage.robot
Resource    ../../resources/support/api.robot
Resource    ../../resources/support/questions.robot

Test Setup  Abrir app
Test Teardown  Cerrar app

#robot -V $(pwd)/configs/android.yaml -V $(pwd)/configs/env.yaml -d reports tests/suites/CheckoutEvents.robot

*** Test Cases ***
T - FDA APP - Android - application.see_more_list
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y revisemos los productos mas vendidos
    Y hagamos la busqueda de los datos en el CDP del evento    see_more_list
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.show_item_list
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y revisemos los productos mas vendidos
    Y hagamos la busqueda de los datos en el CDP del evento    show_item_list
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.view_item_list
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y revisemos los productos mas vendidos
    Y hagamos la busqueda de los datos en el CDP del evento    view_item_list
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.select_item
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y hagamos la busqueda de los datos en el CDP del evento    select_item
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.view_item
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y hagamos la busqueda de los datos en el CDP del evento    view_item
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.share
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y compartimos el producto
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.add_to_wishlist
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y agregamos un producto a la lista de deseados
    Y lo eliminamos de la lista de deseados
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.view_wish_list
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y agregamos un producto a la lista de deseados
    Y lo eliminamos de la lista de deseados
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.remove_from_wish_list
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y agregamos un producto a la lista de deseados
    Y lo eliminamos de la lista de deseados
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.add_to_cart
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.remove_from_cart
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y elimino una unidad del producto en el carrito
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.delete_shopping_cart
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y limpio el carrito de compras
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.ux_mi_carrito
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.ux_edit_carrito
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y al intentar editar un producto del carrito
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.view_cart
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.invalid_cart
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y agrego todas las unidades posibles del primer producto
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.add_shipping_info
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y procedemos con el pago
    Y continuamos sin propina si se solicita
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.change_direction
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y intento cambiar el direccion de envio
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.add_direction
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y intento cambiar el direccion de envio
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.begin_checkout
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y procedemos con el pago
    Y continuamos sin propina si se solicita
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.add_payment_method
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y procedemos con el pago
    Y continuamos sin propina si se solicita
    Y agregamos otro metodo de pago
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.add_payment_info
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y procedemos con el pago
    Y continuamos sin propina si se solicita
    Y seleccionamos el metodo de pago Efectivo al Recibir
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.view_promotion
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y seleccionemos un banner de promociones
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.select_promotion
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y seleccionemos un banner de promociones
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.selectDirection
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y intentemos seleccionar una direccion de envio
    Y seleccionamos la direccion Otro
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta
