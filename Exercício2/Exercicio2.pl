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
:- dynamic proprietario/3.
:- dynamic anofabrico/2.
:- dynamic estado/2.
:- dynamic demo/2.
:- dynamic demoAux/2.

%...................................................................
%...................................................................

% Extensão do predicado automovelC:: Id, construtor -> {V,F,D}

automovelC(1,xico).
automovelC(2,neves).
automovelC(3,rego).
automovelC(4,xico).
automovelC(5,rego).
automovelC(6,neves).
automovelC(7,xico).
automovelC(8,neves).

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

% Não é possivel remover o construtor de um automovel que tenha um ano de fabrico

-automovelC(I,C) :: (-anofabrico(I,X)).

%...................................................................
%...................................................................

% Extensão do predicado automovelM:: Id, marca -> {V,F,D}

automovelM( 1,marcax ).
excecao( automovelM( F,P ) ) :-
    automovelM( F,marcax ).

automovelM(2,toyota).
automovelM(3,opel).
automovelM(4,toyota).
automovelM(5,toyota).
automovelM(6,opel).
automovelM(7,mercedes).
automovelM(8,nissan).

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
automovelm(4,grandeCarro).
automovelm(5,grandeCarro).
automovelm(6,pequenoCarro).
automovelm(7,fininho).
automovelm(8,fininho).

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
matricula(3, xxzz33).
matricula(4, yxxy44).
matricula(5, xzzy55).
matricula(6, yxyx66).
matricula(7, yyxz77).
matricula(8, zzxy88).


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
cor(3,azul).
cor(4,rosa).
cor(5,azul).
cor(6,preto).
cor(7,azul).
cor(8,preto).

cor( 2,corx ).
excecao( cor( F,P ) ) :-
    cor( F,corx ).


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
estado(4,semi-novo).
estado(5,novo).
estado(6,usado).
estado(7,usado).
estado(8,semi-novo).




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
anofabrico(4,2002).
anofabrico(5,2003).
anofabrico(6,2003).
anofabrico(7,2010).
anofabrico(8,2011).



excecao(anofabrico(2,A)) :- A>=1998, A=<2000.

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

proprietario(4,tozé,2005).
proprietario(4,tiago,2006).
proprietario(4,ricardo,2013).

proprietario(5,manuel,2006).
proprietario(5,rita,2008).

proprietario(6,patricia,2012).

proprietario(7,joana,2010).
proprietario(7,joao,2011).

proprietario(8,andre,2014).
proprietario(8,sandra,2015).
proprietario(8,daniela,2013).

-proprietario( A,P,C ) :-
    nao( proprietario( A,P,C ) ),
    nao( excecao( proprietario( A,P,C ) ) ).


%....................................................................
% Extensão do predicado proprietarioDesde : Id,Nome,Ano -> {V,F,D}

proprietarioDesde(I,N,A) :- proprietario(I,N,Z), Z>=A.

-proprietarioDesde( A,P,C ) :-
    nao( proprietarioDesde( A,P,C ) ),
    nao( excecao( proprietarioDesde( A,P,C ) ) ).


%....................................................................
% Extensão do predicado proprietarioAte : Id,Nome,Ano -> {V,F,D}

proprietarioAte(I,N,A) :- proprietario(I,N,Z), Z<A.

-proprietarioAte( A,P,C ) :-
    nao( proprietarioAte( A,P,C ) ),
    nao( excecao( proprietarioAte( A,P,C ) ) ).


%................................................................
% INVARIANTES
%................................................................

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido
+proprietario( I,P,A) :: (solucoes( (I,P,A),(proprietario( I,P,A )),S),
                  comprimento( S,N ), N == 1
                  ).

% Garantir que um registo de compra nunca tem data anterior ao ano de fabrico do automovel

+proprietario(I,P,A) :: (anofabrico(I,A2), A>=A2).


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

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a remoção de conhecimento: Termo -> {v, F}

remocao(Termo) :-
        findall( Invariante, -Termo::Invariante, Lista),
        teste( Lista ) ,
        remover(Termo).
        
remover(Termo) :-
        retract(Termo).

%....................................................................
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}

demo( [],[] ).
demo( [X|L],LR ) :-
	demoAux( X,R ),
	demo( L,[R|LR] ).

demoAux( Q,verdadeiro ) :-
    Q.
demoAux( Q,falso ) :-
    -Q.
demoAux( Q,desconhecido ) :-
    nao( Q ),
    nao( -Q ).

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


