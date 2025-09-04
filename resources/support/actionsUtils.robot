*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Element Was Clicked
    [Arguments]    ${locator}
    # Heurística simple: el elemento ya no está o cambió de estado
    ${present}=    Run Keyword And Return Status    Page Should Contain Element    ${locator}
    ${enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${locator}
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
    # Si ya no está, asumimos que navegó o el click surtió efecto
    Return From Keyword If    not ${present}    ${True}
    # Si sigue presente y visible y habilitado, asumimos que NO clickeó
    ${clicked}=    Set Variable    ${False}
    RETURN    ${clicked}

Tap Centro Del Elemento
    [Arguments]    ${locator}
    ${loc}=     Get Element Location    ${locator}
    ${size}=    Get Element Size        ${locator}
    ${x}=       Evaluate    int(${loc["x"]} + ${size["width"]}*0.15)
    ${y}=       Evaluate    int(${loc["y"]} + ${size["height"]}*0.15)
    Tap    ${x}    ${y}

Scroll Hasta El Final
    ${width}=    Get Window Width
    ${height}=   Get Window Height
    FOR    ${i}    IN RANGE    5
        ${start_x}=    Evaluate    int(${width} / 2)
        ${start_y}=    Evaluate    int(${height} * 0.8)
        ${end_y}=      Evaluate    int(${height} * 0.2)
        Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${start_x}    end_y=${end_y}    duration=1000ms
    END