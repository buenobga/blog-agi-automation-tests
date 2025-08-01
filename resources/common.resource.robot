*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ./po/homepage.robot
Resource   ./po/searchbar.robot
Resource   ./po/searchresultspage.robot
Resource   ./po/segurospage.robot

*** Variables ***
${SCREENSHOT_DIR}               ${OUTPUTDIR}/screenshots

*** Variables ***
${MODO_HEADLESS}                True  # Altere para False para modo normal

*** Keywords ***
Configurar Ambiente
    Create Directory            ${SCREENSHOT_DIR}
    Set Screenshot Directory    ${SCREENSHOT_DIR}

Abrir o navegador
     Configurar Ambiente
     ${chrome_options}=    Set Variable If
     ...    '${MODO_HEADLESS}' == 'True'    add_argument("--headless=new");add_argument("--disable-gpu")
     ...    ${EMPTY}    # Sem opções se não for headless
     Open Browser    about:blank    chrome    options=${chrome_options}
     Set Window Size    1920    1080
    
Fechar o navegador
     Close Browser
