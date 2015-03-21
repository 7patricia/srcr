%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - LEI/3
%---------------------------------------------------------------------
% TRABALHO PRÁTICO EXERCÍCIO 1
%---------------------------------------------------------------------

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

:- dynamic filho/2.
:- dynamic pai/2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :- filho( F,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A,N ) :- filho( N,X ) , filho( X,A ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A,N ) :- descendente(A,N,2).

%---------------------------------------------------------------------
% Extensao do predicado neto : Neto, Avo -> {V,F}

neto( N, A) :- avo(A, N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo(X, Y) = pai(X,Z), avo(Z,Y).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisavo: Trisavo,Trineto -> {V,F}

trisavo(X, Y) = pai(X,Z), bisavo(Z,Y).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado tetraneto: Tetraneto,Tetravo-> {V,F}

tetraneto(X, Y) = trisavo(Y,Z), pai(Z,X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}
descendente( X,Y ) :- filho( X,Y ).
descendente( X,Y ) :- 
	filho( X,A ),
	descendente( A,Y ).	

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}
descendente( D,A,1 ) :- filho( D,A ).
descendente( D,A,G ) :- 
	filho( D,X ),
	descendente( X,A,N),
	G is N+1.