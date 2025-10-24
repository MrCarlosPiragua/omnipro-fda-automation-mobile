*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    BuiltIn

*** Keywords ***
Y hagamos la busqueda de los datos en el CDP del evento
    [Arguments]    ${evento}    ${timeout_min}=10    ${interval_sec}=120
    Set Test Variable    ${evento}    ${evento}
    ${API_KEY}=          Get Variable Value    ${API_KEY}
    ${CLIENT_SECRET}=    Get Variable Value    ${CLIENT_SECRET}
    ${META_SCOPE}=       Get Variable Value    ${META_SCOPE}
    ${IMS_ORG}=          Get Variable Value    ${IMS_ORG}

    &{auth_headers}=    Create Dictionary    Accept=application/json    Content-Type=application/x-www-form-urlencoded
    &{form}=    Create Dictionary    grant_type=client_credentials    client_id=${API_KEY}    client_secret=${CLIENT_SECRET}    scope=${META_SCOPE}
    Create Session    ApiAuth    https://ims-na1.adobelogin.com    disable_warnings=1
    ${responseAuth}=    POST On Session    ApiAuth    /ims/token/v3    data=${form}    headers=${auth_headers}
    ${token}=    Set Variable    ${responseAuth.json()}[access_token]

    &{headers}=    Create Dictionary
    ...    Accept=application/json
    ...    Authorization=Bearer ${token}
    ...    x-api-key=${API_KEY}
    ...    x-gw-ims-org-id=${IMS_ORG}
    ...    x-sandbox-name=prod
    &{params}=    Create Dictionary
    ...    schema.name=_xdm.context.experienceevent
    ...    entityId=2b0911b3bd3708ee7dda13a903606bd1f754836b6181f07817802b998a76adda
    ...    entityIdNS=deviceId
    ...    relatedSchema.name=_xdm.context.profile
    ...    startTime=${TIMESTAMP_TO_SEARCH}
    ...    orderby=-timestamp
    ...    property=eventType="application.${evento}"

    ${max_attempts}=    Evaluate    int(${timeout_min}*60/${interval_sec})
    Create Session    ApiEventsCDP    https://platform.adobe.io    disable_warnings=1
    ${status}=    Set Variable    -1
    ${entity}=    Set Variable    ${None}

    FOR    ${i}    IN RANGE    ${max_attempts}
        ${rc}    ${resp}=    Run Keyword And Ignore Error
        ...    Get On Session    ApiEventsCDP    /data/core/ups/access/entities    params=${params}    headers=${headers}
        Run Keyword If    '${rc}'=='FAIL'    Log    Error en solicitud (intento ${i+1}): ${resp}    WARN
        Run Keyword If    '${rc}'=='FAIL'    Sleep    ${interval_sec}s
        Run Keyword If    '${rc}'=='FAIL'    Continue For Loop

        ${status}=    Set Variable    ${resp.status_code}

        # Renovar token si 401
        IF    '${status}'=='401'
            ${responseAuth}=    POST On Session    ApiAuth    /ims/token/v3    data=${form}    headers=${auth_headers}
            ${token}=    Set Variable    ${responseAuth.json()}[access_token]
            Set To Dictionary    ${headers}    Authorization=Bearer ${token}
            Sleep    2s
            Continue For Loop
        END

        IF    '${status}'=='200'
            ${j}=           Set Variable    ${resp.json()}
            ${children}=    Get From Dictionary    ${j}    children
            ${count}=       Get Length    ${children}
            Run Keyword If    ${count}==0    Fail    200 sin resultados en intento ${i+1}.
            ${first}=       Get From List    ${children}    0
            ${entity}=      Get From Dictionary    ${first}    entity
            Log    Encontrado en intento ${i+1} con 200
            Exit For Loop
        ELSE IF    '${status}'=='404'
            Log    Aún no disponible (404). Intento ${i+1}/${max_attempts}.
        ELSE
            Log    Código inesperado: ${status}. Intento ${i+1}/${max_attempts}.
        END

        Sleep    ${interval_sec}s
    END

    Run Keyword Unless    '${status}'=='200'    Fail    No se encontró application.${evento} en ${timeout_min} min. Último status: ${status}.
    Set Test Variable    ${entity}    ${entity}
