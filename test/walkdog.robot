*** Settings ***
Documentation     A sample of Web Automation using Walkdog page

Resource          ../resources/walkdogMainPage.resource
Default Tags      positive

*** Test Cases ***
Página principal
    Abrir página do Walkdog
    Get Title    equals    Walkdog by Papito

Cadastro
    Abrir página do Walkdog
    Ir para a página de cadastro
    Preencher dados Pessoais
    Preencher informações de endereço
    Selecionar atividades extras
    Fazer Upload de documento
    Submeter formulário
    Checar informações de sucesso