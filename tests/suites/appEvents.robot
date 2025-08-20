*** Settings ***
Resource    ../../resources/support/app.robot
Resource    ../../resources/pages/OnboardingPage.robot
Resource    ../../resources/support/api.robot
Resource    ../../resources/support/questions.robot

Test Setup  Abrir app
Test Teardown  Cerrar app

*** Test Cases ***
T - FDA APP - Android - application.openning_app
    Dado que ingresamos a la aplicacion de Farmacias del ahorro y pasamos el onboarding
    Cuando hagamos la busqueda de los datos en el CDP del evento    openning_app
    Entonces podremos ver que la estructura del evento en cuestion es correcta