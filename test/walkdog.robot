*** Settings ***
Documentation     A sample of Web Automation using Walkdog page

Resource          ../resources/walkdogMainPage.resource
Default Tags      positive
Library    Browser

*** Test Cases ***
Check page's title
    Open Walkdog's page
    Get Title    equals    Walkdog by Papito

Register page
    [Tags]    live
    Open Walkdog's page
    Get Text    a    equals    Quero ser Dog Walker
    Click    a
    Wait For Elements State    form > h1    visible

    #Dados Pessoais
    Fill Text    input[name=name]    Igor Mattos Viana
    Fill Text    input[name=email]    igormv29@gmail.com
    Fill Text    input[name=cpf]    06233301564

    #Cep
    Fill Text    input[name=cep]    40270200
    Click    input[type=button]
    Get Text    input[name=addressStreet]    equals    Rua Doutor Mário Rego dos Santos
    Fill Text    input[name=addressNumber]    314
    Fill Text    input[name=addressDetails]    apto 603
    Get Text    input[name=addressDistrict]    equals    Vila Laura
    Get Text    input[name=addressCityUf]    equals    Salvador/BA

    #Atividades Extras
    Click    img[alt=Cuidar]
    Click    img[alt=Adestrar]    

    #Upload arquivo
    Upload File By Selector    input[accept='image/*']    ./assets/img/CNH_Template.jpg

    #Cadastrar
    Click    button[type=submit]

    #Aguardar popup de sucesso
    Wait For Elements State    div[role=dialog]    visible

    #Checar info do popup de sucesso
    Wait For Elements State    .swal2-icon.swal2-success.swal2-icon-show    visible
    Get Text    id=swal2-title    equals    Obrigado!
    Get Text    id=swal2-html-container    equals    Recebemos o seu cadastro e em breve retornaremos o contato.
    Click    .swal2-actions > .swal2-confirm.swal2-styled
    