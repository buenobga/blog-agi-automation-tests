*** Settings ***
Documentation       Essa suíte automatiza testes funcionais de busca e navegação no Blog do Agi
Resource            ../resources/common.resource.robot
Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador

*** Test Cases ***
Realizar busca por artigos e validar exibição de resultados
        homepage.Acessar Home Page
        Sleep    07s
        searchbar.Clicar para habilitar a pesquisa
        searchbar.Digitar texto valido para pesquisa
        searchbar.Clicar Botão Pesquisar
        searchresultspage.Validar Resultado da Pesquisa

Realizar busca sem resultados
        homepage.Acessar Home Page
        Sleep    07s
        searchbar.Clicar para habilitar a pesquisa
        searchbar.Digitar texto inválido para pesquisa
        searchbar.Clicar Botão Pesquisar
        searchresultspage.Verificar mensagem de nenhum resultado encontrado

Acessar artigo via menu 'Produtos'
        homepage.Acessar Home Page
        Sleep    07s
        segurospage.Passar o mouse sobre o menu 'Produtos'
        segurospage.Clicar no submenu 'Seguros'
        segurospage.Validar título da página 'Seguros'
        segurospage.Validar presença de artigos na página 'Seguros'
        segurospage.Clicar no primeiro artigo da pagina 'Seguros'
