*** Settings ***
Documentation     Resource file to walkdog automation
Library           Browser


*** Keywords ***
Abrir página do Walkdog
    New Browser    chromium    false
    New Page    https://walkdog.vercel.app

Ir para a página de cadastro
    Get Text    a    equals    Quero ser Dog Walker
    Click    a
    Wait For Elements State    form > h1    visible

Preencher dados Pessoais
    Fill Text    input[name=name]    Igor Mattos Viana
    Fill Text    input[name=email]    igormv29@gmail.com
    Fill Text    input[name=cpf]    06233301564

Preencher informações de endereço
    Fill Text    input[name=cep]    40270200
    Clica no botão Buscar CEP
    Get Text    input[name=addressStreet]    equals    Rua Doutor Mário Rego dos Santos
    Fill Text    input[name=addressNumber]    314
    Fill Text    input[name=addressDetails]    apto 603
    Get Text    input[name=addressDistrict]    equals    Vila Laura
    Get Text    input[name=addressCityUf]    equals    Salvador/BA

Clica no botão Buscar CEP
    Click    input[type=button]

Selecionar atividades extras
    Click    img[alt=Cuidar]
    Click    img[alt=Adestrar]

Fazer Upload de documento
    Upload File By Selector    input[accept='image/*']    ./assets/img/CNH_Template.jpg

Submeter formulário
    Click    button[type=submit]

Checar informações de sucesso
    Wait For Elements State    div[role=dialog]    visible
    Wait For Elements State    .swal2-icon.swal2-success.swal2-icon-show    visible
    Get Text    id=swal2-title    equals    Obrigado!
    Get Text    id=swal2-html-container    equals    Recebemos o seu cadastro e em breve retornaremos o contato.
    Click    .swal2-actions > .swal2-confirm.swal2-styled
    Wait For Elements State    img[alt=Walkdog]    visible

Preencher formulário completo
    Preencher dados Pessoais
    Preencher informações de endereço
    Selecionar atividades extras
    Fazer Upload de documento

Test Template - erro de campo obrigatório
    [Arguments]    ${campo}
    Abrir página do Walkdog
    Ir para a página de cadastro
    Preencher formulário completo
    Clear Text    input[name=${campo}]
    Submeter formulário
    Checar alerta de erro    ${campo}

Checar alerta de erro
    [Arguments]    ${error}
    ${msg}    Set Variable If    
    ...    '${error}' == 'docEmpty'    Adcione um documento com foto (RG ou CHN)
    ...    '${error}' == 'cepInvalido'    Informe um CEP válido
    ...    '${error}' == 'name'    Informe o seu nome completo
    ...    '${error}' == 'email'    Informe o seu melhor email
    ...    '${error}' == 'cpf'    Informe o seu CPF
    ...    '${error}' == 'cep'    Informe o seu CEP
    ...    '${error}' == 'addressNumber'    Informe um número maior que zero
    Get Text    .alert-error    equals    ${msg}

Test Template - campo numero
    [Arguments]    ${num}
    Abrir página do Walkdog
    Ir para a página de cadastro
    Preencher formulário completo
    Fill Text    input[name=addressNumber]    ${num}
    Submeter formulário
    Checar alerta de erro    addressNumber
