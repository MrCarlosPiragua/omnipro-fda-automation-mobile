*** Settings ***
Resource    ../../resources/support/app.robot
Resource    ../../resources/pages/OnboardingPage.robot
Resource    ../../resources/pages/LoginPage.robot
Resource    ../../resources/pages/PromocionPage.robot
Resource    ../../resources/pages/MainPage.robot
Resource    ../../resources/pages/MonederoPage.robot
Resource    ../../resources/support/api.robot
Resource    ../../resources/support/questions.robot

Test Setup  Abrir app
Test Teardown  Cerrar app

*** Test Cases ***
T - FDA APP - Android - application.openning_app
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    #Y hagamos la busqueda de los datos en el CDP del evento    openning_app
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.skip_tap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    #Y hagamos la busqueda de los datos en el CDP del evento    skip_tap
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.screen_view
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y revisemos los productos mas vendidos
    #Y hagamos la busqueda de los datos en el CDP del evento    skip_tap
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.see_more_list
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y revisemos los productos mas vendidos
    #Y hagamos la busqueda de los datos en el CDP del evento    see_more_list
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.show_item_list
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y revisemos los productos mas vendidos
    #Y hagamos la busqueda de los datos en el CDP del evento    show_item_list
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.view_item_list
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y revisemos los productos mas vendidos
    #Y hagamos la busqueda de los datos en el CDP del evento    show_item_list
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.select_item
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.view_item
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

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

T - FDA APP - Android - application.invalid_cart
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y agrego 4 unidades mas del producto
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

T - FDA APP - Android - application.confirm_order
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y valido que no hayan productos en el carrito
    Y busquemos el producto Firialta 20 mg Oral 28 Tabs
    Y seleccionamos el primer producto
    Y se agregua el producto al carrito
    Y reviso el carrito de compras
    Y procedemos con el pago
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
    Y agregamos otro metodo de pago
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.menuTap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y naveguemos al menu de Promociones
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.directionTap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y intentemos seleccionar una direccion de envio
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

T - FDA APP - Android - application.logOut
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y naveguemos al menu de Cuenta
    Y vamos a la seccion de Cerrar Sesion
    Y procedemos a cerrar sesion
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.forgotPasswd
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando intentemos recuperar contrasena
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.loginTap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.signUpTap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando intentemos crear una nueva cuenta
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.getMonedero
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y entramos a la seccion de monedero del ahorro
    Y en la seccion monedero damos tap en Obtener Monedero
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.getMonederoLater
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y entramos a la seccion de monedero del ahorro
    Y en la seccion monedero damos tap en En otro momento
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.ux_eliminar_monedero
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y entramos a la seccion de monedero del ahorro
    Y iniciamos en el monedero 9600471216859
    Y entramos a la seccion de monedero del ahorro
    Y eliminamos el monedero
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.ux_estado_cuenta_tap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y entramos a la seccion de monedero del ahorro
    Y iniciamos en el monedero 9600471216859
    Y entramos a la seccion de monedero del ahorro
    Y vemos el estado de cuenta
    Y eliminamos el monedero
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.option_tap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y entramos a la seccion de monedero del ahorro
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta