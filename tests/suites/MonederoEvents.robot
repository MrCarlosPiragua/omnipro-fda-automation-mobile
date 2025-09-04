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

#robot -V $(pwd)/configs/android.yaml -V $(pwd)/configs/env.yaml -d reports tests/suites/MonederoEvents.robot

*** Test Cases ***

T - FDA APP - Android - application.ux_asociar_monedero
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y entramos a la seccion de monedero del ahorro
    Y iniciamos en el monedero 9600471216859
    Y entramos a la seccion de monedero del ahorro
    Y eliminamos el monedero
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

T - FDA APP - Android - application.ux_estado_cuenta_view
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