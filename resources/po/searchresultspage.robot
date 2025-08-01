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
Validar Resultado da Pesquisa
    Wait Until Location Contains             ?s=${PESQUISA_VALIDA}        timeout=${TIMEOUT_MEDIO}
    Element Text Should Be                   xpath=${TEXTO_PESQUISADO}    ${PESQUISA_VALIDA}
    Wait Until Page Contains Element         xpath=${ARTIGOS}             timeout=${TIMEOUT_MEDIO}
    Capture Page Screenshot 


Verificar mensagem de nenhum resultado encontrado
    Wait Until Location Contains             ?s=${PESQUISA_INVALIDA}      timeout=${TIMEOUT_MEDIO}
    Element Text Should Be                   xpath=${TEXTO_PESQUISADO}    ${PESQUISA_INVALIDA}
    Wait Until Page Contains Element         xpath=${SEM_RESULTADO}       timeout=${TIMEOUT_MEDIO}
    Capture Page Screenshot 
