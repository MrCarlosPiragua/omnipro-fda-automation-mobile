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

#robot -V $(pwd)/configs/android.yaml -V $(pwd)/configs/env.yaml -d reports tests/suites/AccountEvents.robot

*** Test Cases ***
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

T - FDA APP - Android - application.login
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos login en el aplicativo
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta

T - FDA APP - Android - application.signUpTap
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando intentemos crear una nueva cuenta
    #Y hagamos la busqueda de los datos en el CDP del evento    ux_edit_carrito
    #Entonces podremos ver que la estructura del evento en cuestion es correcta
