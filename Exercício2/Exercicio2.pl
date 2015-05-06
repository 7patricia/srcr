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


%....................................................................
% SICStus PROLOG: Declaracoes iniciais ..............................
%....................................................................

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%-..................................................................
% SICStus PROLOG: definicoes iniciais...............................
%...................................................................

:- op( 900,xfy,'::' ).
:- dynamic automovelC/2.
:- dynamic automovelM/2.
:- dynamic automovelm/2.
:- dynamic cor/2.
:- dynamic matricula/2.
:- dynamic proprietario/5.
:- dynamic anofabrico/2.
:- dynamic estado/2.

%...................................................................
%...................................................................

% Extensão do predicado automovelC:: Id, construtor -> {V,F,D}

automovelC(1,xico).
automovelC(2,neves).
automovelC(3,rego).

-automovelC( A,C ) :-
    nao( automovelC( A,C ) ),
    nao( excecao( automovel( A,C ) ) ).

%................................................................
% INVARIANTES
%................................................................

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido

+automovelC( I,C ) :: (solucoes( (I,C),(automovelC( I,C )),S ),
                  comprimento( S,N ), N == 1
                  ).

% Invariante Referencial: nao admitir mais do que 1 construtor
%                         para um mesmo automovel

+automovelC( I,C ) :: (solucoes( (Cs),(automovelC( I,Cs )),S ),
                  comprimento( S,N ), N =< 1
                  ).

%...................................................................
%...................................................................

% Extensão do predicado automovelM:: Id, marca -> {V,F,D}

automovelM( 1,marcax ).
excecao( automovelM( F,P ) ) :-
    automovelM( F,marcax ).

automovelM(2,toyota).
automovelM(3,opel).

-automovelM( A,M ) :-
    nao( automovelM( A,M ) ),
    nao( excecao( automovelM( A,M ) ) ).


%................................................................
% INVARIANTES
%................................................................

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido

+automovelM( I,M ) :: (solucoes( (I,M),(automovelC( I,M )),S ),
                  comprimento( S,N ), N == 1
                  ).

% Invariante Referencial: nao admitir mais do que 1 marca
%                         para um mesmo automovel

+automovelM( I,M ) :: (solucoes( (Ms),(automovelC( I,Ms )),S ),
                  comprimento( S,N ), N =< 1
                  ).

%...................................................................
%...................................................................

% Extensão do predicado automovel:: Id, modelo -> {V,F,D}

automovelm(1,grandeCarro).
automovelm(2,pequenoCarro).
automovelm(3,fininho).

-automovelm( A,M ) :-
    nao( automovelm( A,M ) ),
    nao( excecao( automovelm( A,M ) ) ).

%................................................................
% INVARIANTES
%................................................................

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido

+automovelm( I,M ) :: (solucoes( (I,M),(automovelm( I,M )),S ),
                  comprimento( S,N ), N == 1
                  ).

% Invariante Referencial: nao admitir mais do que 1 modelos
%                         para um mesmo automovel

+automovelm( I,M ) :: (solucoes( (Ms),(automovelm( I,Ms )),S ),
                  comprimento( S,N ), N =< 1
                  ).


%...................................................................
%...................................................................

% Extensão do predicado matricula :: Id, matricula -> {V,F,D}

matricula(1, xxaa11).
matricula(2, xxyy22).

excecao( matricula( 3,xxzz33 ) ).
excecao( matricula( 3,xxzy33 ) ).

-matricula( A,M ) :-
    nao( matricula( A,M ) ),
    nao( excecao( matricula( A,M ) ) ).

%................................................................
% INVARIANTES
%................................................................

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido
+matricula( I,M ) :: (solucoes( (I,M),(matricula( I,M )),S ),
                  comprimento( S,N ), N == 1
                  ).

% Invariante Referencial: nao admitir mais do que 1 matricula
%                         para um mesmo automovel

+matricula( I,M ) :: (solucoes( (Ms),(matricula( I,Ms )),S ),
                  comprimento( S,N ), N =< 1
                  ).

%...................................................................
%...................................................................

% Extensão do predicado cor :: Id, cor -> {V,F,D}

cor(1,verde).

cor( 2,corx ).
excecao( cor( F,P ) ) :-
    cor( F,corx ).

cor(3,azul).

-cor( A,C ) :-
    nao( cor( A,C ) ),
    nao( excecao( cor( A,C ) ) ).

%....................................................................
% Extensao do predicado cores: Id,Resultados -> {V,F}

cores(I, R) :-
findall(P, cor(I, P), S),
R = S .

%................................................................
% INVARIANTES
%................................................................

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido
+cor( I,C) :: (solucoes( (I,C),(cor( I,C )),S ),
                  comprimento( S,N ), N == 1
                  ).

%...................................................................
%...................................................................

% Extensão do predicado estado :: Id, estado -> {V,F,D}

excecao( estado( 2,novo ) ).
excecao( estado( 2,seminovo ) ).

-estado( A,M ) :-
    nao( estado( A,M ) ),
    nao( excecao( estado( A,M ) ) ).

estado(1,novo).
estado(3,usado).




%................................................................
% INVARIANTES
%................................................................

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido
+estado( I,E ) :: (solucoes( (I,E),(estado( I,E )),S ),
                  comprimento( S,N ), N == 1
                  ).

% Invariante Referencial: nao admitir mais do que 1 estado
%                         para um mesmo automovel

+estado( I,E ) :: (solucoes( (Es),(estado( I,Es )),S ),
                  comprimento( S,N ), N =< 1
                  ).

%...................................................................
%...................................................................

% Extensão do predicado anofabrico :: Id, ano -> {V,F,D}

anofabrico(1,2015).
anofabrico(2,2010).

anofabrico( 3,anox ).
excecao( anofabrico( F,P ) ) :-
    anofabrico( F,anox ).

nulo( anox ).

-anofabrico( A,C ) :-
    nao( anofabrico( A,C ) ),
    nao( excecao( anofabrico( A,C ) ) ).


%................................................................
% INVARIANTES
%................................................................

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido
+anofabrico( I,A ) :: (solucoes( (I,A),(anofabrico( I,A )),S ),
                  comprimento( S,N ), N == 1
                  ).

% Invariante Referencial: nao admitir mais do que 1 ano
%                         para um mesmo automovel

+anofabrico( I,A ) :: (solucoes( (As),(anofabrico( I,As )),S ),
                  comprimento( S,N ), N =< 1
                  ).

% Invariante para garantir que nunca vai ser inserido o ano de fabrico do carro 3

+anofabrico( F,P ) :: (solucoes( (3,As),(anofabrico(3,As),nao(nulo(As))),S ),
                  comprimento( S,N ), N == 0 
                  ).

%...................................................................
%...................................................................

%Extensão do predicado proprietario :: Id, nome, ano -> {V,F,D}

proprietario(1,manel,2015).
proprietario(2,tiago,2010).
proprietario(2,jorge,2013).
proprietario(3,zeca,2005).
proprietario(3,rita,2010).
proprietario(3,sara,2012).

-proprietario( A,P,C ) :-
    nao( proprietario( A,P,C ) ),
    nao( excecao( proprietario( A,P,C ) ) ).

%....................................................................
% Extensao do predicado proprietarios: Id,Resultados -> {V,F}

proprietarios(I, R) :-
findall(P, proprietario(I,P,A), S),
R = S .

%....................................................................
% Extensão do predicado proprietarioDesde : Id,Nome,Ano -> {V,F,D}

proprietarioDesde(I,N,A) :- proprietario(I,N,Z), Z>=A.

-proprietarioDesde( A,P,C ) :-
    nao( proprietarioDesde( A,P,C ) ),
    nao( excecao( proprietarioDesde( A,P,C ) ) ).

%....................................................................
% Extensão do predicado proprietariosDesde : Id,Ano,Resultado -> {V,F}

proprietariosDesde(I,A,R) :- findall(N,proprietarioDesde(I,N,A),S), R = S.

%....................................................................
% Extensão do predicado proprietarioAte : Id,Nome,Ano -> {V,F,D}

proprietarioAte(I,N,A) :- proprietario(I,N,Z), Z<A.

-proprietarioAte( A,P,C ) :-
    nao( proprietarioAte( A,P,C ) ),
    nao( excecao( proprietarioAte( A,P,C ) ) ).

%....................................................................
% Extensão do predicado proprietariosAte : Id,Ano,Resultado -> {V,F}

proprietariosAte(I,A,R) :- findall(N,proprietarioAte(I,N,A),S), R = S.


%................................................................
% INVARIANTES
%................................................................

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido
+proprietario( I,P,A) :: (solucoes( (I,P,A),(proprietario( I,P,A )),S),
                  comprimento( S,N ), N == 1
                  ).

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


