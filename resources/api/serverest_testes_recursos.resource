*** Settings ***
Documentation    O Objetivo deste arquivo é armazenar todos os recursos para os testes
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar sessao
    ${headers}    Create Dictionary
    ...    accept=aplication/json
    ...    Content-Type=application/json
    Create Session
    ...    alias=APIServeRest
    ...    url=https://serverest.dev
    ...    verify=True
    # ...    url=http://localhost:3000
    ...    headers=${headers}

Criar novo usuário
    ${palavra_randomica}    Generate Random String
    ...    length=8
    ...    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case    ${palavra_randomica}
    Set Test Variable    ${EMAIL_TEST}    ${palavra_randomica}@testecleston.com.br
    Log    ${EMAIL_TEST}

Cadastrar o novo usuario criado
    ${body}    Create Dictionary
    ...    nome=Jose Bezerra
    ...    email=${EMAIL_TEST}
    ...    password=teste
    ...    administrador=true
    Log    ${body}
    Criar sessao
    ${response}    POST On Session    alias=APIServeRest    url=/usuarios    json=${body}
    Log    ${response.json()}
    Set Test Variable    ${ID_USER}    ${response.json()["_id"]}
    Set Test Variable    ${response}    ${response.json()}

Conferir se este usuário foi cadastrado corretamente
    Log    ${response}    
    Dictionary Should Contain Item    ${response}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${response}    _id

Consultar dados do usuário
    ${resposta_consulta}    GET on Session 
    ...    alias=APIServeRest    
    ...    url=/usuarios/${ID_USER}    
    ...    expected_status=200
    Set Test Variable    
    ...    ${RESPOSTA_CONSULTA}
    ...    ${resposta_consulta.json()}
    
Conferir os dados do novo usuário
    Log    ${RESPOSTA_CONSULTA}
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    nome             Jose Bezerra
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    email            ${EMAIL_TEST}
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    password          teste
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    administrador     true
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    _id               ${ID_USER}

Alterar perfil de administrador para false
    ${alterar_perfil_usuarios}    PUT On Session    
    ...    alias=APIServeRest
    ...    url=/usuarios/${ID_USER}
    ...    expected_status=200
    ...    data={"nome":"Fausto Vera", "email":"${EMAIL_TEST}","password":"teste", "administrador": "false"}

Excluir usuário
    ${excluir_user}    DELETE On Session
    ...    alias=APIServeRest  
    ...    url=/usuarios/${ID_USER}
    ...    expected_status=200
    Set Test Variable    
    ...    ${RESPOSTA_CONSULTA_DELETE}
    ...    ${excluir_user.json()}


Conferir exclusão do usuário
    Log    ${RESPOSTA_CONSULTA_DELETE}
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA_DELETE}    message    Registro excluído com sucesso