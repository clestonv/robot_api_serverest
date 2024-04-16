*** Settings ***
Resource    ../resources/serverest_testes_recursos.resource

*** Variables ***


*** Test Cases ***
Cenário com DELETE: Excluir usuário existente
    Criar novo usuário
    Cadastrar o novo usuario criado
    Excluir usuário
    Conferir exclusão do usuário