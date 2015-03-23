%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - LEI/3
%---------------------------------------------------------------------
% TRABALHO PRÁTICO EXERCÍCIO 1
%---------------------------------------------------------------------

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).
:- op( 900,xfy,'::' ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- dynamic filho/2.
:- dynamic pai/2.
:- dynamic primo/2.
:- dynamic tio/2.
:- dynamic sobrinho/2.
:- dynamic natural/2.

%----------------------------------------------------------------------
% Extensao do predicado comprimento: Lista,Comprimento -> {V,F}

comprimento( [],0 ).
comprimento( [X|L],N ) :-
    comprimento( L,N1 ),
    N is N1+1.

%--------------------------------- - - - - - - - - - - - - - - -
% Extensao do predicado nao: Questao -> {V,F}
nao(Questao) :-
Questao, !, fail .
nao(Questao) .

%--------------------------------- - - - - - - - - - - - - - - -
% Extensão do predicado apagaRepetidos: L, R -> {V, F}
apagaRepetidos([], []) .
apagaRepetidos([H|T], R) :- apagatudo(H, T, X), apagaRepetidos(X, Y), R = [H|Y] .

%--------------------------------- - - - - - - - - - - - - - - -
% Extensão do predicado apagatudo: E, L, R -> {V, F}
apagatudo([], _, []).
apagatudo(H, [H|T], R) :- apagatudo(H, T, X),R = X .
apagatudo(E, [H|T], R) :- H \== E, apagatudo(E, T, X), R = [H|X] .


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :- 
				findall(Invariante, +Termo::Invariante,Lista),
				insercao( Termo),
				teste(Lista)
				.

insercao(Termo) :- 
		assert(Termo).

insercao(Termo) :-
		retract(Termo),!,fail.

teste([]).
teste([R|LR]) :-
	R,
	teste(LR).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a remoção do conhecimento

remocao(Termo) :- retract(Termo).


%---------------------------------------------------------------------
% INVARIANTES


% INVARIANTES ESTRUTURAIS - NÃO PERMITEM INSERÇÃO DE CONHECIMENTO 

+natural(I,L) :: (findall( (I,L),(natural( I,L )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).

+filho(F,P) :: (findall( (F,P),(filho( F,P )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).
+avo(A,N) :: (findall( (A,N),(avo( A,N )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).
+neto(N,A) :: (findall( (N,A),(neto( N,A )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).

+pai(P,F) :: (findall((P,F),(pai(P,F)),S),
			comprimento(S,N),
			N==1
			).

+irmao(A,B) :: (findall((A,B),(irmao(A,B)),S),
			comprimento(S,N),
			N==1
			).

+tio(T,S) :: (findall((T,S),(tio(T,S)),R),
			comprimento(R,N),
			N==1
			).

+sobrinho(S,T) :: (findall((S,T),(sobrinho(S,T)),S),
			comprimento(S,N),
			N==1
			).
+primo(A,B) :: (findall((A,B),(primo(A,B)),S),
			comprimento(S,N),
			N==1
			).
%--------------------------------------------------------------------
% INVARIANTES REFERENCIAIS

%--- INVARIANTE QUE NÃO PERMITE UM INDIVIDUO SER NATURAL DE MAIS DO QUE UM LOCALIDADE

+natural(I,N) :: (findall((Ns),(natural(I,Ns)),S),
				comprimento(S,X),
				X=<2
				).

%--- INVARIANTES QUE NÃO PERMITEM MAIS DO QUE 2 PROGENITORES PARA O MESMO INDIVIDUO

+filho( F,P ) :: ( findall((Ps),(filho(F,Ps)),S),
				   comprimento(S,X),
				   X=<2
                  ). 
+pai(P,F) :: (findall((Ps),(pai(Ps,F)),S),
			comprimento(S,X),
			X =<2
			).
%----- INVARIANTES QUE NÃO PERMITEM MAIS DO QUE 4 AVOS PARA O MESMO INDIVIDUO

+neto(N,A) :: (findall((As),(neto(N,As)),S),
			comprimento(S,X),
			X=<4
			).

+avo(A,N) :: (findall((As),(avo(As,N)),S),
			comprimento(S,X),
			X=<4
			).

%---- INVARIANTE QUE NÃO PERMITE QUE O FILHO SEJA PAI DO PAI
+pai(P,F) :: nao(filho(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE O IRMAO SEJA PAI DO iRMAO
+pai(P,F) :: nao(irmao(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE O PRIMO SEJA PAI DO PRIMO
+pai(P,F) :: nao(primo(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE O TIO SEJA PAI DO SOBRINHO
+pai(P,F) :: nao(tio(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE O SOBRINHO SEJA PAI DO TIO
+pai(P,F) :: nao(sobrinho(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE O AVO SEJA PAI DO NETO
+pai(P,F) :: nao(avo(P,F)).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

filho(patricia,luis).
filho(patricia,olga).

filho(sara,luis).
filho(sara,olga).

filho(rui,isabel).
filho(rui,joaquim).

filho(tiago,suzana).
filho(tiago,ze).

filho(mariana,suzana).
filho(mariana,ze).

filho(matias,suzana).
filho(matias,ze).

filho(pedro,carlos).
filho(pedro,sameiro).

filho(olga,maria).
filho(olga,antonio).

filho(carlos,maria).
filho(carlos,antonio).

filho(isabel,maria).
filho(isabel,antonio).

filho(luis,argentina).
filho(luis,manuel).

filho(ze,argentina).
filho(ze,manuel).

%--------------------------------------------------------------------
% Extensao do predicado natural : Individuo,Localidade -> {V,F}

natural(patricia,arcos).
natural(sara,arcos).
natural(luis,arcos).
natural(olga,arcos).

natural(matias,barca).
natural(mariana,barca).
natural(tiago,barca).
natural(manuel,barca).
natural(suzana,barca).

natural(rui,moncao).
natural(isabel,moncao).
natural(joaquim,moncao).

natural(pedro,arcos).
natural(sameiro,arcos).
natural(carlos,arcos).

natural(argentina,arcos).
natural(manuel,arcos).

natural(antonio,tavora).
natural(maria,tavora).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filhos: Pai,Resultados -> {V,F}

filhos(I, R) :-
findall(P, filho(P, I), S),
R = S .

% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A,N ) :- filho( N,X ) , filho( X,A ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avos: Neto,Resultados -> {V,F}

avos(I, R) :-
findall(P, avo(P, I), S),
R = S .

%---------------------------------------------------------------------
% Extensão do predicado neto : Neto,Avo -> {V,F}

neto(N,A) :- avo(A,N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado netos: Avo,Resultados -> {V,F}

netos(I, R) :-
findall(P, neto(P, I), S),
R = S .

%----------------------------------------------------
% Extensão do predicado irmao : Irmao,Irmao -> {V,F}

irmao(A,B) :- pai(X,A), pai(X,B), A \== B.

%
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado irmao: Irmao,Irmao -> {V,F}

irmao(A,B) :- irmao(B,A).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado irmaos: Irmao,Resultados -> {V,F}

irmaos(I, R) :-
	findall(P, irmao(P, I), S),
	apagaRepetidos(S,X),
	R = X.

%---------------------------------------------------------------------
% Extensão do predicado tio: Tio,Sobrinho -> {V,F}

tio(T,S) :- irmao(T,P), filho(S,P).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado tios: Sobrinho,Resultados -> {V,F}

tios(I, R) :-
	findall(P, tio(P, I), S),
	apagaRepetidos(S,X),
	R = X .

%---------------------------------------------------------------------
% Extensão do predicado primo: Primo, Primo -> {V,F}

primo(X,Y) :- pai(Z,X), tio(Z,Y).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado primos: Primo,Resultados -> {V,F}

primos(I, R) :-
	findall(P, primo(P, I), S),
	apagaRepetidos(S,X),
	R = X .

%---------------------------------------------------------------------
% Extensão do predicado sobrinho: Sobrinho,Tio -> {V,F}

sobrinho(S,T) :- tio(T,S). 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sobrinhos: Tio,Resultados -> {V,F}

sobrinhos(I, R) :-
	findall(P, sobrinho(P, I), S),
	apagaRepetidos(S,X),
	R = X .

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :- filho( F,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pais: Filho,Resultados -> {V,F}

pais(I, R) :-
findall(P, pai(P, I), S),
R = S .

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}
descendente( X,Y ) :- filho( X,Y ).
descendente( X,Y ) :- 
	filho( X,A ),
	descendente( A,Y ).	

%--------------------------------------------------------------------
% Extensão do predicado descendentes: Ascendente, Resultado -> {V,F}

descendentes(I,R) :- findall(D,descendente(D,I),S),
					R = S.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendente: Ascendente, Descendente -> {V,F}
ascendente( X,Y ) :- descendente( Y,X ).


%--------------------------------------------------------------------
% Extensão do predicado ascendentes: Descendente, Resultado -> {V,F}

ascendentes(I,R) :- findall(D,ascendente(D,I),S),
					R = S.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}
descendente( D,A,1 ) :- filho( D,A ).
descendente( D,A,G ) :- 
	filho( D,X ),
	descendente( X,A,N),
	G is N+1.

%--------------------------------------------------------------------
% Extensão do predicado descendentes: Ascendente, Grau, Resultado -> {V,F}

descendentes(I,G,R) :- findall(D,descendente(D,I,G),S),
					R = S.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendente: Ascendente,Descendente,Grau -> {V,F}
ascendente( D,A,G ) :- descendente(A,D,G).

%--------------------------------------------------------------------
% Extensão do predicado ascendentes: Descendente, Grau, Resultado -> {V,F}

ascendentes(I,G,R) :- findall(A,ascendente(A,I,G),S),
					R = S.


%---------------------------------------------------------------------
% Extensão do predicado descendenteAte : Descendente, Ascendente, Grau -> {V,F}

descendenteAte(D,A,G) :- descendente(D,A,Z), Z=<N.


%---------------------------------------------------------------------
% Extensão do predicado descendentesAte : Ascendente,Grau,Resultado -> {V,F}

descendentesAte(I,G,R) :- findall(D,descendenteAte(D,I,G),S), R = S.

%---------------------------------------------------------------------
% Extensão do predicado ascendenteAte : Ascendente,Descendente, Grau -> {V,F}

ascendenteAte(A,D,G) :- descendenteAte(D,A,G).


%---------------------------------------------------------------------
% Extensão do predicado ascendentesAte : Descendente,Grau,Resultado -> {V,F}

ascendentesAte(I,G,R) :- findall(A,ascendenteAte(A,I,G),S), R = S.

