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
:- dynamic natural/2.
:- dynamic filho/2.
:- dynamic pai/2.

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

%----------------------------------------------------------------
% Extensao do predicado apagaTudo : Elemento, Lista, Resultado ->{V,F}

apagaTudo(X,[],[]).
apagaTudo(X,[X|L],R) :- apagaTudo(X,L,Res), R = Res.
apagaTudo(X,[Y|L],R) :- X\==Y, apagaTudo(X,L,NL), R = [Y|NL].

%----------------------------------------------------------------
% Extensao do predicado apagaRepetidos: Lista,Resultado -> {V,F}

apagaRepetidos([],[]).
apagaRepetidos([X|L],R) :- apagaTudo(X,L,Res), apagaRepetidos(Res,ResFinal), R = [X|ResFinal].

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
				X=<1
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

%---- INVARIANTE QUE NÃO PERMITE QUE O NETO SEJA PAI DO AVO
+pai(P,F) :: nao(neto(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE O Bisavo SEJA PAI DO Bisneto
+pai(P,F) :: nao(bisavo(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE O BISNETO SEJA PAI DO BISAVO
+pai(P,F) :: nao(bisneto(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE O Trisavo SEJA PAI DO Trisneto
+pai(P,F) :: nao(trisavo(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE O TRISNETO SEJA PAI DO TRISAVO
+pai(P,F) :: nao(trisneto(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE COMPANHEIROS SEJAM PAI UM DO OUTRO
+pai(P,F) :: nao(companheiro(P,F)).

%---- INVARIANTE QUE NÃO PERMITE QUE CUNHADOS SEJAM PAI UM DO OUTRO
+pai(P,F) :: nao(cunhado(P,F)).



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

filho(maria,isilda).
filho(maria,nelo).

filho(isilda,joana).


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

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo(X, Y) :- pai(X,Z), avo(Z,Y).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavos: Bisneto,Resultados -> {V,F}

bisavos(I, R) :-
findall(P, bisavo(P, I), S),
R = S .

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisneto: Bisneto,Bisavo -> {V,F}

bisneto(X, Y) :- bisavo(Y,X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisnetos: Bisavo,Resultados -> {V,F}

bisnetos(I, R) :-
findall(P, bisneto(P, I), S),
R = S .

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisavo: Trisavo,Trineto -> {V,F}

trisavo(X, Y) :- pai(X,Z), bisavo(Z,Y).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisavos: Trisneto,Resultados -> {V,F}

trisavos(I, R) :-
findall(P, trisavo(P, I), S),
R = S .

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisneto: Trisneto,Trisavo-> {V,F}

trisneto(X, Y) :- trisavo(Y,Z).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisnetos: Trisavo,Resultados -> {V,F}

trisnetos(I, R) :-
findall(P, trisneto(P, I), S),
R = S .

%----------------------------------------------------
% Extensão do predicado irmao : Irmao,Irmao -> {V,F}

irmao(A,B) :- pai(X,A), pai(X,B), A \== B.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado irmaos: Irmao,Resultados -> {V,F}

irmaos(I, R) :-
	findall(P, irmao(P, I), S),
	apagaRepetidos(S,Res),
	R = Res.

%---------------------------------------------------------------------
% Extensão do predicado tio: Tio,Sobrinho -> {V,F}

tio(T,S) :- irmao(T,P), filho(S,P).
tio(T,S) :- companheiro(A,T), irmao(A,X), filho(S,X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado tios: Sobrinho,Resultados -> {V,F}

tios(I, R) :-
	findall(P, tio(P, I), S),
	apagaRepetidos(S,Res),
	R = Res .

%---------------------------------------------------------------------
% Extensão do predicado primo: Primo, Primo -> {V,F}

primo(X,Y) :- pai(Z,X), tio(Z,Y).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado primos: Primo,Resultados -> {V,F}

primos(I, R) :-
	findall(P, primo(P, I), S),
	apagaRepetidos(S,Res),
	R = Res .

%---------------------------------------------------------------------
% Extensão do predicado sobrinho: Sobrinho,Tio -> {V,F}

sobrinho(S,T) :- tio(T,S). 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sobrinhos: Tio,Resultados -> {V,F}

sobrinhos(I, R) :-
	findall(P, sobrinho(P, I), S),
	apagaRepetidos(S,Res),
	R = Res .

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

descendenteAte(D,A,G) :- descendente(D,A,Z), Z=<G.


%---------------------------------------------------------------------
% Extensão do predicado descendentesAte : Ascendente,Grau,Resultado -> {V,F}

descendentesAte(I,G,R) :- findall(D,descendenteAte(D,I,G),S), R = S.

%---------------------------------------------------------------------
% Extensão do predicado ascendenteAte : Ascendente,Descendente, Grau -> {V,F}

ascendenteAte(A,D,G) :- descendenteAte(D,A,G).


%---------------------------------------------------------------------
% Extensão do predicado ascendentesAte : Descendente,Grau,Resultado -> {V,F}

ascendentesAte(I,G,R) :- findall(A,ascendenteAte(A,I,G),S), R = S.

%----------------------------------------------------------------------
% Extensao do predicado relacao : Individuo, Individuo, Relacao -> {V,F}

relacao(A,B,pai) :- pai(A,B).
relacao(A,B,filho) :- filho(A,B).
relacao(A,B,avo) :- avo(A,B).
relacao(A,B,neto) :- neto(A,B).
relacao(A,B,tio) :- tio(A,B).
relacao(A,B,sobrinho) :- sobrinho(A,B).
relacao(A,B,primo) :- primo(A,B).
relacao(A,B,irmao) :- irmao(A,B).
relacao(A,B,bisavo) :- bisavo(A,B).
relacao(A,B,bisneto) :- bisneto(A,B).
relacao(A,B,trisavo) :- trisavo(A,B).
relacao(A,B,trisneto) :- trisneto(A,B).
relacao(A,B,companheiro) :- companheiro(A,B).
relacao(A,B,cunhado) :- cunhado(A,B).


%-------------------------------------------------------------------------
% Extensao do predicado companheiro : Individuo, Individuo -> {V,F}

companheiro(A,B) :- filho(X,A), filho(X,B).

%-------------------------------------------------------------------------
% Extensao do predicado cunhado : Individuo, Individuo -> {V,F}

cunhado(A,B) :- companheiro(A,X), irmao(X,B).
cunhado(A,B) :- companheiro(A,X), irmao(X,Y), companheiro(Y,B).




