%.....................................................................
% SIST. REPR. CONHECIMENTO E RACIOCINIO - LEI/3.......................
%.....................................................................
% EXERCICIO 2 ........................................................
% GRUPO06 ............................................................
% ANDRÉ GERALDES .....................................................
% PATRÍCIA BARROS ....................................................
% SANDRA FERREIRA ....................................................
%.....................................................................
%.....................................................................
% Programacao em logica estendida ....................................
% ....................................................................
% Representacao de conhecimento imperfeito ...........................
% COMÉRCIO AUTOMOVEL

% Extensão do predicado automovel:: Id, construtor -> {V,F,D}

automovel(1,xico).
automovel(2,neves).
automovel(3,rego).

% Extensão do predicado automovel:: Id, marca -> {V,F,D}

automovel(1,nissan).
automovel(2,toyota).
automovel(3,opel).

% Extensão do predicado automovel:: Id, modelo -> {V,F,D}

automovel(1,grandeCarro).
automovel(2,pequenoCarro).
automovel(3,fininho).

% Extensão do predicado matricula :: Id, matricula -> {V,F,D}

matricula(1, XX-AA-11).
matricula(2, XX-YY-22).
matricula(3, XX-ZZ-33).


% Extensão do predicado cor :: Id, cor -> {V,F,D}

cor(1,verde).
cor(2,azul).
cor(3,vermelho).

% Extensão do predicado estado :: Id, estado -> {V,F,D}

estado(1,novo).
estado(2,semi-novo).
estado(3,usado).

% Extensão do predicado anofabrico :: Id, ano -> {V,F,D}

anofabrico(1,2015).
anofabrico(2,2010).
anofabrico(3,1994).

%......................................................................

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

%....................................................................
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao, falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%......................................................................
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%.......................................................................

solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

comprimento( S,N ) :-
    length( S,N ).


