*** Settings ***
Library    AppiumLibrary
Library    Collections
Library    ../../.venv/lib/python3.9/site-packages/robot/libraries/Telnet.py
 
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
    Sleep    9s
    Tap Por Porcentaje
    
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