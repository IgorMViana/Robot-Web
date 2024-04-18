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
    Preencher formulário completo
    Submeter formulário
    Checar informações de sucesso

Valida erros de campos obrigatórios
    [Tags]    negative
    [Template]    Test Template - erro de campo obrigatório
    name
    email
    cpf
    cep
    addressNumber

Valida erro quando documento não é enviado
    [Tags]    negative
    Abrir página do Walkdog
    Ir para a página de cadastro
    Preencher dados Pessoais
    Preencher informações de endereço
    Submeter formulário
    Checar alerta de erro    docEmpty

Valida erro quando CEP inválido
    [Tags]    negative
    Abrir página do Walkdog
    Ir para a página de cadastro
    Clica no botão Buscar CEP
    Checar alerta de erro    cepInvalido

Valida campo Número com valores não permitidos
    [Tags]    negative
    [Template]    Test Template - campo numero
    0
    -1