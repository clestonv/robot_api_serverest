*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections

*** Variables ***
${URL}            https://front.serverest.dev/login
${BROWSER}        Chrome
${cad_link}        [data-testid="cadastrar"]   
${input_nome}     [data-testid="nome"]
${input_email}    [data-testid="email"]
${input_senha}    [data-testid="password"]
${inputCheckAdmin}    [data-testid="checkbox"]
${btn_cad}    [data-testid="cadastrar"]
${form_cad}    [class="register-page container"]
${home_page}    div.jumbotron

*** Keywords ***
Criar novo usuário
    ${palavra_randomica}    Generate Random String
    ...    length=8
    ...    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case    ${palavra_randomica}
    Set Test Variable    ${EMAIL_TEST}    ${palavra_randomica}@testecleston.com.br
    Log    ${EMAIL_TEST}
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--headless")
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
    Criar novo usuário
    Wait Until Element Is Visible    css=${input_email}
    Input Text    css=${input_email}    text=${EMAIL_TEST}
Passo 5 - Digitar uma senha
    Wait Until Element Is Visible    css=${input_senha}
    Input Text    css=${input_senha}    text=senha
Passo 6 - Escolher perfil de usuário administrador
    Wait Until Element Is Visible    css=${inputCheckAdmin}
    Click Element    css=${inputCheckAdmin}
  Capture Element Screenshot    css=${form_cad}
Passo 7 - Clicar em cadastrar
    Wait Until Element Is Visible    css=${btn_cad}
    Sleep    10s
    Wait Until Element Is Visible    css=${home_page}
    Element Should Be Visible    css=${home_page}
    Capture Element Screenshot    css=${home_page}
