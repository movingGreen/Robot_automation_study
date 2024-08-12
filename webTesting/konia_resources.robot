*** Settings ***
Library    SeleniumLibrary
Library    DateTime


*** Variables ***
${URL}    https://konia.com.br/
${MENU_QUEM_SOMOS}    (//a[@href='https://konia.com.br/quem-somos/'][contains(.,'Quem somos')])[1]
${TITLE_QUEM_SOMOS}    Quem Somos - Konia Consultoria e Informática
${MENU_BLOG}    (//a[@href='https://konia.com.br/blog/'][contains(.,'Blog')])[1]
${BOTAO_PESQUISA}    //button[@type='submit'][contains(.,'Pesquisar')]
${CAMPO_PESQUISA_BLOG}    //input[@placeholder='Pesquisar …']
${VALIDACAO_ARTIGO}    //a[contains(., 'O que é o JMeter?')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=firefox
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que o usuário esteja na página home page da Konia.com.br
    Go To    url=${URL}

Quando ele clicar no menu "Quem Somos"
    Click Element    locator=${MENU_QUEM_SOMOS}

Então o título da página devcerpa ser "Quem Somos - Konia Consultoria e Informática"
    Wait Until Page Contains    text=${TITLE_QUEM_SOMOS}

Quando ele clicar no menu "Blog"
    Click Element    locator=${MENU_BLOG}

E pesquisar por "${PESQUISA}" no campo de busca
    Input Text    locator=${CAMPO_PESQUISA_BLOG}    text=${PESQUISA}
    Click Element    locator${BOTAO_PESQUISA}

Então deverá ser exibido na tela artigos refente ao tema buscado
    Wait Until Page Contains Element    locator=${VALIDACAO_ARTIGO}