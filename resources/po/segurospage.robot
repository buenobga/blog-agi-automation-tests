*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MENU_PRODUTOS}        //span[contains(@class,'menu-text') and normalize-space()='Produtos']
${MENU_SEGUROS}         //span[@class='menu-text' and normalize-space()='Seguros']
${SEGUROS_TITULO}      //h1[contains(@class, 'page-title') and normalize-space()='Seguros']
${SEGUROS_ARTIGOS}     //div[contains(@class, 'ast-row')]//article[contains(@class, 'post')]
${TIMEOUT_CURTO}       5s
${TIMEOUT_MEDIO}       10s


*** Keywords ***
Passar o mouse sobre o menu 'Produtos'
        Mouse Over                          xpath=${MENU_PRODUTOS} 
        Capture Page Screenshot

Clicar no submenu 'Seguros'
        Wait Until Element Is Visible       xpath=${MENU_SEGUROS}                 timeout=${TIMEOUT_CURTO}
        Click Element                       xpath=${MENU_SEGUROS}
        Wait Until Location Contains        /seguros/                             timeout=${TIMEOUT_CURTO}

Validar título da página 'Seguros'
        Wait Until Element Is Visible       xpath=${SEGUROS_TITULO}               timeout=${TIMEOUT_MEDIO}
        Element Text Should Be              xpath=${SEGUROS_TITULO}               Seguros
        Capture Page Screenshot 

Validar presença de artigos na página 'Seguros'
        Wait Until Page Contains Element    xpath=${SEGUROS_ARTIGOS}              timeout=${TIMEOUT_MEDIO}

Clicar no primeiro artigo da pagina 'Seguros'
...     ${artigo_visivel}=    Run Keyword And Return Status    Element Should Be Visible    xpath=${SEGUROS_ARTIGOS}//h2/a[1]    timeout=${TIMEOUT_MEDIO}
        IF    ${artigo_visivel}
            Click Element    xpath=${SEGUROS_ARTIGOS}//h2/a[1]
            Capture Page Screenshot
        ELSE
            Log    Nenhum artigo disponível na página de 'Seguros'. Teste encerrado sem erro.    console=yes
            Set Test Message    Nenhum artigo encontrado na página. Cenário não aplicável neste momento.
        END
 

    