% testscript voor individuele stukken

#const dimX=3.
#const dimY=3.
#const n=2.

1{at(1..n, vak(X,Y))}1 :- X=1..dimX, Y=1..dimY.

hasXneighbour(N,X,Y) :- at(N, vak(X,Y)), at(N, vak(X+1,Y)).
hasYneighbour(N,X,Y) :- at(N, vak(X,Y)), at(N, vak(X,Y+1)).
hasneighbour(N,X,Y,1) :- hasXneighbour(N,X,Y).
hasneighbour(N,X,Y,2) :- hasYneighbour(N,X,Y).

% stuk 11 (SG 455-J) heeft 5 vakken aaneensluitend met een blok van 4 met een vakje eraan geplakt
%
% **
% ***
%:- {at(1, V)}!=5.
%:- {hasneighbour(1,X,Y,T)}!=5.

% stuk 1
%:- {at(1, V)}!=4.
%:- {hasneighbour(1,X,Y,T)}!=3.
%:- {hasXneighbour(1,X,Y)}>2.
%:- {hasYneighbour(1,X,Y)}>2.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y-1).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X2,Y2), Y<Y2.
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y+1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X-1,Y+1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X2,Y2), X<X2.

% stuk 2 (SG 455-I) heeft 3 vakken aaneensluitend maar niet 3 op een rij
% ** ** *   *
% *   * ** **
%:- {at(1, V)}!=3.
%:- {hasXneighbour(1,X,Y)}!=1.
%:- {hasYneighbour(1,X,Y)}!=1.

%stuk 3
%:- {at(1, V)}!=4.
%:- {hasneighbour(1,X,Y,T)}!=3.
%:- {hasXneighbour(1,X,Y)}>2.
%:- {hasYneighbour(1,X,Y)}>2.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X2,Y2), Y!=Y2.
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X2,Y2), X!=X2.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X,Y).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X,Y-1).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+2,Y).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+2,Y-1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X-1,Y).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y+2).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X-1,Y+2).

%stuk 4
%:- {at(1, V)}!=4.
%:- {hasneighbour(1,X,Y,T)}!=3.
%:- {hasXneighbour(1,X,Y)}>2.
%:- {hasYneighbour(1,X,Y)}>2.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X,Y+1).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1).

%stuk5
%:- {at(1, V)}!=5.
%:- {hasneighbour(1,X,Y,T)}!=4.
%:- {hasXneighbour(1,X,Y)}==2.
%:- {hasXneighbour(1,X,Y)}>3.
%:- {hasYneighbour(1,X,Y)}>3.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X2,Y2), Y!=Y2.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y-1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X2,Y2), X!=X2.
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y+1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X-1,Y+1).

%stuk6
%:- {at(1, V)}!=5.
%%:- {hasneighbour(1,X,Y,T)}!=4.
%:- {hasXneighbour(1,X,Y)}==2.
%:- {hasXneighbour(1,X,Y)}>3.
%:- {hasYneighbour(1,X,Y)}>3.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X2,Y2), Y!=Y2.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasXneighbour(1,X+2,Y), hasYneighbour(1,X,Y).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasXneighbour(1,X+2,Y), hasYneighbour(1,X,Y-1).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasXneighbour(1,X+2,Y), hasYneighbour(1,X+3,Y).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasXneighbour(1,X+2,Y), hasYneighbour(1,X+3,Y-1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X2,Y2), X!=X2.
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasYneighbour(1,X,Y+2), hasXneighbour(1,X,Y).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasYneighbour(1,X,Y+2), hasXneighbour(1,X-1,Y).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasYneighbour(1,X,Y+2), hasXneighbour(1,X,Y+3).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasYneighbour(1,X,Y+2), hasXneighbour(1,X-1,Y+3).

%stuk7
%:- {at(1, V)}!=5.
%:- {hasneighbour(1,X,Y,T)}!=4.
%:- {hasXneighbour(1,X,Y)}!=2.
%:- {hasYneighbour(1,X,Y)}!=2.
%:- hasXneighbour(1,X,Y), hasYneighbour(1,X+1,Y-1), hasYneighbour(1,X,Y-1).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1).

%stuk8
%:- {at(1, V)}!=5.
%:- {hasneighbour(1,X,Y,T)}!=4.
%:- {hasXneighbour(1,X,Y)}!=2.
%:- {hasYneighbour(1,X,Y)}!=2.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X2,Y2), Y!=Y2.
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X2,Y2), X!=X2.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y-1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y+1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X-1,Y+1).

%stuk 9
%:- {at(1, V)}!=5.
%:- {hasneighbour(1,X,Y,T)}!=4.
%:- {hasXneighbour(1,X,Y)}==0.
%:- {hasXneighbour(1,X,Y)}==2.
%:- {hasYneighbour(1,X,Y)}==0.
%:- {hasYneighbour(1,X,Y)}==2.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasXneighbour(1,X+2,Y).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasYneighbour(1,X,Y+2).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y+1).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y-1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X-1,Y+1).

%stuk 10
%:- {at(1, V)}!=5.
%:- {hasneighbour(1,X,Y,T)}!=4.
%:- {hasXneighbour(1,X,Y)}!=2.
%:- {hasYneighbour(1,X,Y)}!=2.
%:- hasXneighbour(1,X,Y), hasYneighbour(1,X+1,Y-1), hasYneighbour(1,X,Y-1).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X2,Y2), hasYneighbour(1,X3,Y3), hasYneighbour(1,X4,Y4), X!=X2, Y3!=Y4.
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y).
%:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y-1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y+1).
%:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X-1,Y+1).


%STUK 11
%:- {at(1, V)}!=5.
%:- {hasneighbour(1,X,Y,T)}!=5.

%stuk 12
:- {at(1, V)}!=5.
:- {hasneighbour(1,X,Y,T)}!=4.
:- {hasXneighbour(1,X,Y)}!=2.
:- {hasYneighbour(1,X,Y)}!=2.
% geen blokvorming
:- hasXneighbour(1,X,Y), hasYneighbour(1,X+1,Y-1), hasYneighbour(1,X,Y-1).

% geen 2 rijtjes van 2
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X2,Y2), hasYneighbour(1,X2,Y2+1).

% geen stuk 7 vorm
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y+1), hasYneighbour(1,X2,Y2), hasYneighbour(1,X2+1,Y2+1).
:- hasXneighbour(1,X,Y), hasXneighbour(1,X-1,Y+1), hasYneighbour(1,X2,Y2), hasYneighbour(1,X2+1,Y2-1).

% geen vormen met alleen haken aan uiteinden
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X,Y), hasYneighbour(1,X+2,Y).
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X,Y), hasYneighbour(1,X+2,Y-1).
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X,Y), hasYneighbour(1,X,Y-1).
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+2,Y), hasYneighbour(1,X+2,Y-1).
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+2,Y), hasYneighbour(1,X,Y-1).
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+2,Y-1), hasYneighbour(1,X,Y-1).

:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y), hasXneighbour(1,X,Y+2).
:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y), hasXneighbour(1,X-1,Y+2).
:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y), hasXneighbour(1,X-1,Y).
:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y+2), hasXneighbour(1,X-1,Y+2).
:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y+2), hasXneighbour(1,X-1,Y).
:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X-1,Y+2), hasXneighbour(1,X-1,Y).


