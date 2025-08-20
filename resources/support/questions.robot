*** Settings ***
Library    JSONLibrary
Library    Collections
Library    OperatingSystem

*** Keywords ***
Entonces podremos ver que la estructura del evento en cuestion es correcta
    Validar contra schema    ${entity}    ${CURDIR}/../../resources/schemas/${evento}.schema.json

Validar contra schema
    [Arguments]    ${data}    ${schema_path}
    ${schema_txt}=    Get File    ${schema_path}
    &{ns}=    Create Dictionary    data=${data}    s=${schema_txt}
    ${schema}=    Evaluate    __import__('json').loads(s)    namespace=${ns}
    &{ns}=    Create Dictionary    data=${data}    schema=${schema}
    Evaluate    __import__('jsonschema').validate(data, schema)    namespace=${ns}
