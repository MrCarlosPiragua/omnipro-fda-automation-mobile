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

#robot -V $(pwd)/configs/android.yaml -V $(pwd)/configs/env.yaml -d reports tests/suites/NavigationEvents.robot

*** Test Cases ***
T - FDA APP - Android - application.openning_app
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y hagamos la busqueda de los datos en el CDP del evento    openning_app
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.skip_tap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y hagamos la busqueda de los datos en el CDP del evento    skip_tap
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.screen_view
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y revisemos los productos mas vendidos
    Y hagamos la busqueda de los datos en el CDP del evento    screen_view
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.view_general_search_results
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta
    Y buscamos para tener la lista de resultados
    Y hagamos la busqueda de los datos en el CDP del evento    view_general_search_results
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.view_branch_search_results
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta
    Y buscamos para tener la lista de resultados
    Y seleccionamos una categoria para filtro
    #Y hagamos la busqueda de los datos en el CDP del evento    view_branch_search_results
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.productSearchSelected
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y busquemos el producto Firialta
    Y buscamos para tener la lista de resultados
    Y seleccionamos el primer resultado
    #Y hagamos la busqueda de los datos en el CDP del evento    productSearchSelected
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.ux_category_menu
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y seleccionamos la categoria Bebes
    Y hagamos la busqueda de los datos en el CDP del evento    ux_category_menu
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.menu_tap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y naveguemos al menu de Promociones
    Y hagamos la busqueda de los datos en el CDP del evento    menu_tap
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.select_category_promotion
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y naveguemos al menu de Promociones
    Y selecciono un categoria
    y un banner de promocion
    Y hagamos la busqueda de los datos en el CDP del evento    select_category_promotion
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.select_banner_promotion
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y naveguemos al menu de Promociones
    Y selecciono un categoria
    y un banner de promocion
    Y hagamos la busqueda de los datos en el CDP del evento    select_banner_promotion
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.ux_mi_cuenta
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y naveguemos al menu de Cuenta
    Y vamos a la seccion de Mis Pedidos
    Y hagamos la busqueda de los datos en el CDP del evento    ux_mi_cuenta
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.social_media_click
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y demos click en la red social de Facebook
    Y hagamos la busqueda de los datos en el CDP del evento    social_media_click
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.ct_whatsapp
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando omitiamos el inicio de sesion
    Y saltemos la promocion inicial
    Y demos click en la red social de WhatsApp
    Y hagamos la busqueda de los datos en el CDP del evento    ct_whatsapp
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.direction_tap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y intentemos seleccionar una direccion de envio
    Y hagamos la busqueda de los datos en el CDP del evento    direction_tap
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.error_form
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando intentemos crear una nueva cuenta
    Y con tipo de creacion contrasena incorrecta
    Y hagamos la busqueda de los datos en el CDP del evento    error_form
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.error_custom_dart
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando intentemos crear una nueva cuenta
    Y con tipo de creacion correo existente
    Y hagamos la busqueda de los datos en el CDP del evento    error_custom_dart
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.get_directions_to_branch
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y naveguemos al menu de Sucursales
    Y seleccionemos una sucursal
    Y hagamos la busqueda de los datos en el CDP del evento    get_directions_to_branch
    Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.option_tap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    Y saltemos la promocion inicial
    Y entramos a la seccion de monedero del ahorro antes
    Y hagamos la busqueda de los datos en el CDP del evento    option_tap
    Entonces podremos ver que la estructura del evento en cuestion es correcta