*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BOTAO_LUPA}           //div[contains(@class, 'ast-search-menu-icon')]
${CAMPO_PESQUISA}       //input[contains(@id, 'search-field')]
${TEXTO_PESQUISADO}     //section[contains(@class, 'ast-archive-description')]//h1//span
${ARTIGOS}              //div[contains(@class, 'ast-row')]//article[contains(@class, 'post')]
${SEM_RESULTADO}        //section[contains(@class, 'no-results')]

${TIMEOUT_CURTO}        5s
${TIMEOUT_MEDIO}        10s

${PESQUISA_VALIDA}      pix
${PESQUISA_INVALIDA}    morango


*** Keywords ***
Clicar para habilitar a pesquisa
    Wait Until Page Contains Element         xpath=${BOTAO_LUPA}
    Wait Until Element Is Visible            xpath=${BOTAO_LUPA}          timeout=${TIMEOUT_CURTO}
    Execute Javascript                       document.querySelector(".ast-search-menu-icon.slide-search").classList.add('ast-dropdown-active')
    Capture Page Screenshot 

Digitar texto valido para pesquisa
    Wait Until Element Is Visible            xpath=${CAMPO_PESQUISA}      timeout=${TIMEOUT_CURTO}
    Input Text                               xpath=${CAMPO_PESQUISA}      ${PESQUISA_VALIDA}
    Capture Page Screenshot 


Digitar texto inválido para pesquisa
    Wait Until Element Is Visible            xpath=${CAMPO_PESQUISA}      timeout=${TIMEOUT_MEDIO}
    Input Text                               xpath=${CAMPO_PESQUISA}      ${PESQUISA_INVALIDA}
    Capture Page Screenshot 

Clicar Botão Pesquisar
    Execute Javascript                       document.querySelector("button[aria-label='Enviar pesquisa']").click()

