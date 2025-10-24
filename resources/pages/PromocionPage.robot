*** Settings ***
Library    AppiumLibrary
Library    Collections
Library    ../../.venv/lib/python3.9/site-packages/robot/libraries/Telnet.py
*** Variables ***
&{PROMOCION_ANDROID_LOCATORS}
...    PROMOCION_1=xpath=//android.widget.ImageView
...    SELECT_PRIMER_CATEGORIA_DE_PROMOCION=xpath=(//android.widget.ImageView)[2]
...    SELECT_PRIMER_BANNER_DE_RESULTADOS=xpath=(//android.widget.ImageView[1])[3]
...    MENU_BAR_INICIO=accessibility_id=Inicio
&{PROMOCION_IOS_LOCATORS}
...    INPUT_INGRESA_TU_CORREO_ELECTRONICO=xpath=(//android.widget.EditText)[1]
*** Keywords ***
_locator
    [Arguments]    ${name}
    ${is_android}=    Run Keyword And Return Status    Should Be Equal As Strings    ${PLATFORM}    Android
    IF    ${is_android}
        ${loc}=    Get From Dictionary    ${PROMOCION_ANDROID_LOCATORS}    ${name}
    ELSE
        ${loc}=    Get From Dictionary    ${PROMOCION_IOS_LOCATORS}    ${name}
    END
    RETURN    ${loc}

Y saltemos la promocion inicial
    #${PROMOCION_1}=    _locator    PROMOCION_1
    Sleep    9s
    #${visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${PROMOCION_1}    15s
    #Run Keyword If    ${visible}    Tap    ${PROMOCION_1}    duration=0.5s
    #Sleep    9s
    Tap Por Porcentaje
    #Sleep    4s
    #Tap    ${MENU_BAR_INICIO}    duration=0.5s
    Sleep    9s


Tap Por Porcentaje
    [Arguments]    ${x_pct}=0.5    ${y_pct}=0.1
    ${w}=    Get Window Width
    ${h}=    Get Window Height
    ${x}=    Evaluate    int(round(${w} * ${x_pct}))
    ${y}=    Evaluate    int(round(${h} * ${y_pct}))
    Tap Por Posicion    ${x}    ${y}

Tap Por Posicion
    [Arguments]    ${x}    ${y}
    ${is_android}=    Run Keyword And Return Status    Should Be Equal As Strings    ${PLATFORM}    Android
    IF    ${is_android}
        Tap Por Posicion En Android    ${x}    ${y}
    ELSE
        Tap Por Posicion En Ios       ${x}    ${y}
    END

Tap Por Posicion En Android
    [Arguments]    ${x}    ${y}
    @{pt}=    Create List    ${x}    ${y}
    Tap With Positions    100ms    ${pt}

Tap Por Posicion En Ios
    [Arguments]    ${x}    ${y}
    &{args}=    Create Dictionary    x=${x}    y=${y}
    Execute Script    mobile: tap    ${args}

Y selecciono un categoria
    ${SELECT_PRIMER_CATEGORIA_DE_PROMOCION}=    _locator    SELECT_PRIMER_CATEGORIA_DE_PROMOCION
    Wait Until Element Is Visible    ${SELECT_PRIMER_CATEGORIA_DE_PROMOCION}    10s
    Tap    ${SELECT_PRIMER_CATEGORIA_DE_PROMOCION}    duration=0.5s
    Sleep    7s

y un banner de promocion
    ${SELECT_PRIMER_BANNER_DE_RESULTADOS}=    _locator    SELECT_PRIMER_BANNER_DE_RESULTADOS
    Wait Until Element Is Visible    ${SELECT_PRIMER_BANNER_DE_RESULTADOS}    10s
    Tap    ${SELECT_PRIMER_BANNER_DE_RESULTADOS}    duration=0.5s
    Sleep    7s