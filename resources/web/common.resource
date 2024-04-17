*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://front.serverest.dev/login
${cad_link}        [data-testid="cadastrar"]   
${input_nome}     [data-testid="nome"]
${input_email}    [data-testid="email"]
${input_senha}    [data-testid="password"]
${inputCheckAdmin}    [data-testid="checkbox"]
${btn_cad}    [data-testid="cadastrar"]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar navegador
    Close Browser
Passo 1 - Acessar a pagina de Login ServerRest
    Go To    url=${URL}

Passo 2 - Clicar em cadastre-se
    Wait Until Element Is Visible    css=${cad_link}
    Click Element    css=${cad_link}
Passo 3 - Digitar um nome
    Wait Until Element Is Visible    css=${input_nome}
    Input Text    css=${input_nome}    text=Julio Tavares
Passo 4 - Digitar um e-mail
    Wait Until Element Is Visible    css=${input_email}
    Input Text    css=${input_email}    text=teste@email.com
Passo 5 - Digitar uma senha
    Wait Until Element Is Visible    css=${input_senha}
    Input Text    css=${input_senha}    text=senha
Passo 6 - Escolher perfil de usuário administrador
    Wait Until Element Is Visible    css=${inputCheckAdmin}
    Click Element    css=${inputCheckAdmin}
Passo 7 - Clicar em cadastrar
    Wait Until Element Is Visible    css=${btn_cad}
    Sleep    6s
    Set Screenshot Directory    path