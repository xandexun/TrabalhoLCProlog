# Sistema Pericial de Jogos em Prolog

Este projeto é um sistema pericial que ajuda a encontrar jogos da Steam com base em vários critérios.

## O que faz?

O programa faz uma série de perguntas ao utilizador, como:
-   Género(s) do jogo
-   Categoria(s) (Single-player, MMO, etc.)
-   Faixa de preço
-   Avaliação mínima
-   Data de lançamento
-   E outros...

Com base nas respostas, ele procura numa base de dados e apresenta uma lista de jogos que correspondem a **todos** os critérios escolhidos.

## Como Funciona?

O sistema está dividido em duas partes principais:

1.  **`perito.pl` (O Motor)**:
    -   É o programa principal que gere a conversa com o utilizador.
    -   Ele não sabe nada sobre jogos, apenas sabe como fazer perguntas e seguir regras.

2.  **`jogossteam.pl` (A Base de Conhecimento)**:
    -   Contém a "inteligência" sobre os jogos.
    -   Define quais perguntas devem ser feitas e como testar se um jogo satisfaz as respostas do utilizador.

## Como Usar

1.  **Requisitos**: Ter o [SWI-Prolog](https://www.swi-prolog.org/) instalado.
2.  **Organização**: Coloca todos os ficheiros (`perito.pl`, `jogossteam.pl`) na mesma pasta.
3.  **Execução**:
    -   Abra o terminal e navegue para a pasta do projeto.
    -   Carregue o motor: `?- consult('perito.pl').`
    -   Inicie o sistema: `?- perito.`
4.  **Interação**:
    -   Siga o menu para carregar a base de conhecimento (`jogossteam.pl`).
    -   Escolha "Solucionar" para começar a busca.
    -   Responda cada pergunta, **lembrando-se de terminar cada resposta com um ponto final (`.`) e seguindo as regras propostas em cada pergunta!**.
