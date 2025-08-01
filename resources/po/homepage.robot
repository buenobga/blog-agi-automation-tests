*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_URL}            https://blog.agibank.com.br

*** Keywords ***
Acessar Home Page    
    Go To              ${HOME_URL} 


    
