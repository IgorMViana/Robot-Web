*** Settings ***
Documentation     A sample of Web Automation using Walkdog page

Resource          ../resources/walkdogMainPage.resource
Default Tags      positive
Library    Browser

*** Test Cases ***
Check page's title
    Abrir página do Walkdog
    Get Title    equals    Walkdog by Papito

Register page
    Abrir página do Walkdog
    Ir para a página de cadastro
    Preencher dados Pessoais
    Preencher informações de endereço
    Selecionar atividades extras
    Fazer Upload de documento
    Submeter formulário
    Checar informações de sucesso