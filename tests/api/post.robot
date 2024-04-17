*** Settings ***
Resource    ../../resources/api/serverest_testes_recursos.resource

*** Variables ***


*** Test Cases ***
Cenário com POST: Cadastrar um novo usuário com sucesso
    Criar novo usuário
    Cadastrar o novo usuario criado
    Conferir se este usuário foi cadastrado corretamente
    
    