*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    BuiltIn

*** Variables ***

*** Keywords ***
Y hagamos la busqueda de los datos en el CDP del evento
    [Arguments]    ${evento}
    Set Test Variable    ${evento}    ${evento}
    ${API_KEY}=    Get Variable Value    ${API_KEY}
    ${CLIENT_SECRET}=    Get Variable Value    ${CLIENT_SECRET}
    ${META_SCOPE}=    Get Variable Value    ${META_SCOPE}
    ${IMS_ORG}=    Get Variable Value    ${IMS_ORG}

    &{headers}=    Create Dictionary    
    ...    Accept=application/json    
    ...    Content-Type=application/x-www-form-urlencoded
    &{form}=    Create Dictionary    
    ...    grant_type=client_credentials    
    ...    client_id=${API_KEY}    
    ...    client_secret=${CLIENT_SECRET}    
    ...    scope=${META_SCOPE}
    
    Create Session    ApiAuth    https://ims-na1.adobelogin.com    disable_warnings=1
    ${responseAuth}=    POST On Session    ApiAuth    /ims/token/v3    data=${form}    headers=${headers}
    Log    ${responseAuth.json()}
    ${token}    Set Variable    ${responseAuth.json()}[access_token]

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

    Sleep    15 minutes

    Create Session    ApiEventsCDP    https://platform.adobe.io    disable_warnings=1
    ${responseEventCDP}=    Get On Session    ApiEventsCDP    /data/core/ups/access/entities    params=${params}    headers=${headers}
    Should Be Equal As Integers    ${responseEventCDP.status_code}    200
    ${j}=    Set Variable    ${responseEventCDP.json()}    # método llamado con sintaxis extendida
    ${children}=    Get From Dictionary    ${j}       children
    ${first}=       Get From List          ${children}    0
    ${entity}=      Get From Dictionary    ${first}    entity
    Log    ${entity}
    Set Test Variable    ${entity}    ${entity}