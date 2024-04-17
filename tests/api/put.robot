*** Settings ***
Resource    ../../resources/api/serverest_testes_recursos.resource

*** Variables ***


*** Test Cases ***
Cenário PUT: Atualizar os dados de um usuário
    Criar novo usuário
    Cadastrar o novo usuario criado
    Consultar dados do usuário
    Alterar perfil de administrador para false
    Consultar dados do usuário
