%% perito.pl

:- dynamic executa/2.
:- dynamic conhece/3.

perito :-
    write('Motor de Inferencia Avancado para Sistemas Periciais'), nl,
    write('Versao de 2024'), nl, nl,
    esperaOrdens(123).

esperaOrdens(MC) :-
    mostraComandos(MC),
    write('> '),
    read(Comando),
    executa(MC,Comando).

mostraComandos(123) :-
    write('Comandos disponiveis (introduza o numero seguido de ponto final, ex: 1.):'), nl,
    write('1 - Consultar uma Base de Conhecimento (BC)'), nl,
    write('2 - Solucionar'), nl,
    write('3 - Sair'), nl.

mostraComandos(23) :-
    write('Comandos disponiveis (introduza 2. ou 3.):'), nl,
    write('2 - Solucionar'), nl,
    write('3 - Sair'), nl.

executa(_,1) :-
    write('Nome da BC (ex: ''jogossteam.pl''): '),
    read(F),
    consult(F),
    write('BC consultada com sucesso.'), nl, nl,
    continua.

executa(_,2) :-
    soluciona,
    esperaOrdens(23).

executa(_,3) :-
    nl,
    write('Volte Sempre!'), nl,
    halt.

executa(MC,X) :-
    write(X), write(' nao e um comando valido!'), nl,
    esperaOrdens(MC).

continua :-
    retract( (executa(_,1) :- _) ),
    esperaOrdens(23).

soluciona :-
    abolish(conhece,3),
    asserta(conhece(def,def,def)),
    
    findall(Jogo, objectivo(Jogo), TodasAsRespostas),
    
    ( TodasAsRespostas == [] ->
        nl, nl, write('Nao foi encontrado nenhum jogo que satisfaca os criterios :('), nl, nl
    ;
        processa_respostas_iterativo(TodasAsRespostas, 1)
    ).

processa_respostas_iterativo([], _) :-
    nl, write('Nao ha mais jogos.'), nl.
processa_respostas_iterativo([Primeira | Resto], Contador) :-
    nl, write('--- Resposta #'), write(Contador), write(' ---'), nl,
    mostra_resultado(Primeira),
    nl,
    ( Resto == [] ->
        nl, write('Nao ha mais jogos.'), nl
    ;
        write('Proximo jogo (sim/nao)'), nl,
        write('> '),
        read(Comando),
        ( Comando == sim ->
            write('A procurar...'), nl,
            NovoContador is Contador + 1,
            processa_respostas_iterativo(Resto, NovoContador)
        ;
            write('Busca terminada pelo utilizador.'), nl
        )
    ).


questiona(Atributo,Valor) :-
    conhece(sim,Atributo,Valor), !.
questiona(Atributo,Valor) :-
    conhece(_,Atributo,Valor), !, fail.
questiona(Atributo,Valor) :-
    format('~w:~w? (sim/nao) ', [Atributo, Valor]),
    read(R),
    processa_simples(R,Atributo,Valor).
processa_simples(sim,Atributo,Valor) :- asserta(conhece(sim,Atributo,Valor)).
processa_simples(R,Atributo,Valor) :- asserta(conhece(R,Atributo,Valor)), fail.

questiona(Atr,Val,_) :- conhece(sim,Atr,Val), !.
questiona(Atr,_,_) :- conhece(sim,Atr,_), !, fail.
questiona(Atr,Val,ListaOpcoes) :-
    format('Qual o valor para ~w? ~n', [Atr]),
    write(ListaOpcoes), nl,
    read(X),
    processa_menu(X,Atr,Val,ListaOpcoes).

processa_menu(Val,Atr,Val,_) :- asserta(conhece(sim,Atr,Val)).
processa_menu(X,Atr,_,ListaOpcoes) :- member(X,ListaOpcoes), asserta(conhece(sim,Atr,X)), fail.
processa_menu(_,Atr,Val,ListaOpcoes) :- questiona(Atr,Val,ListaOpcoes).

pergunta_lista(Atributo, Palavras) :-
    conhece(texto, Atributo, Palavras), !.
pergunta_lista(Atributo, Palavras) :-
    format('Introduza uma lista para ~w (ex: [opcao1, opcao2]. ou [indiferente].):~n> ', [Atributo]),
    read(P),
    asserta(conhece(texto, Atributo, P)),
    Palavras = P.

pergunta_numero(Atributo, Numero) :-
    conhece(numero, Atributo, Numero), !.
pergunta_numero(Atributo, Numero) :-
    format('Qual o valor para ~w? (escreva um numero ou ''indiferente''.)~n> ', [Atributo]),
    read(N),
    ( (number(N) ; N == indiferente) ->
        asserta(conhece(numero, Atributo, N)),
        Numero = N
    ;
        pergunta_numero(Atributo, Numero)
    ).

pergunta_data(Ano, Mes, Dia) :-
    conhece(data, ano, Ano),
    conhece(data, mes, Mes),
    conhece(data, dia, Dia), !.

pergunta_data(Ano, Mes, Dia) :-
    pergunta_numero('Ano de lancamento', Ano),
    asserta(conhece(data, ano, Ano)),
    ( Ano == indiferente ->
        Mes = indiferente,
        Dia = indiferente
    ;
        format('Deseja especificar o mes? (sim/nao)~n> '), read(R),
        ( R == sim ->
            pergunta_numero('Mes de lancamento (1-12)', Mes)
        ;
            Mes = indiferente
        ),
        asserta(conhece(data, mes, Mes)),
        ( Mes == indiferente ->
            Dia = indiferente
        ;
            format('Deseja especificar o dia? (sim/nao)~n> '), read(R2),
            ( R2 == sim ->
                pergunta_numero('Dia de lancamento (1-31)', Dia)
            ;
                Dia = indiferente
            )
        )
    ),
    asserta(conhece(data, dia, Dia)).