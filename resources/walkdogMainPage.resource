*** Settings ***
Documentation     Resource file to walkdog automation
Library           Browser


*** Keywords ***
Abrir página do Walkdog
    New Browser    chromium    true
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
    Click    input[type=button]
    Get Text    input[name=addressStreet]    equals    Rua Doutor Mário Rego dos Santos
    Fill Text    input[name=addressNumber]    314
    Fill Text    input[name=addressDetails]    apto 603
    Get Text    input[name=addressDistrict]    equals    Vila Laura
    Get Text    input[name=addressCityUf]    equals    Salvador/BA

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