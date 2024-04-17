*** Settings ***
Resource    ../../resources/api/serverest_testes_recursos.resource

*** Variables ***


*** Test Cases ***
Cenário com GET: Consultar os dados de um novo usuário
    Criar novo usuário
    Cadastrar o novo usuario criado
    Consultar dados do usuário
    Conferir os dados do novo usuário
