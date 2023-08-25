% script for smartgames iq puzzler pro solver - assignment 2 ModelBased AI 
% definieer de plaatsing van n=12 aantal stukken op een bord van X=5 bij Y=11 vakken waarbij elk vak hooguit door 1 stuk bezet is

#const dimX=11.
#const dimY=5.
#const n=12.

% defineer eventueel een geforceerde begin toestand (bt): 

%starter level (should solve in <0.1s)
%bt(1,vak(5,1)).
%bt(1,vak(6,1)).
%bt(1,vak(5,2)).
%bt(1,vak(5,3)).

%bt(2,vak(6,5)).
%bt(2,vak(7,5)).
%bt(2,vak(7,4)).

%bt(4,vak(6,2)).
%bt(4,vak(7,2)).
%bt(4,vak(7,1)).
%bt(4,vak(8,1)).

%bt(5,vak(3,2)).
%bt(5,vak(4,2)).
%bt(5,vak(4,3)).
%bt(5,vak(4,4)).
%bt(5,vak(4,5)).

%bt(6,vak(1,1)).
%bt(6,vak(2,1)).
%bt(6,vak(2,2)).
%bt(6,vak(3,1)).
%bt(6,vak(4,1)).

%bt(7,vak(5,4)).
%bt(7,vak(5,5)).
%bt(7,vak(6,4)).
%bt(7,vak(6,3)).
%bt(7,vak(7,3)).

%bt(10,vak(1,4)).
%bt(10,vak(1,5)).
%bt(10,vak(2,5)).
%bt(10,vak(3,4)).
%bt(10,vak(3,5)).

%bt(12,vak(1,2)).
%bt(12,vak(1,3)).
%bt(12,vak(2,3)).
%bt(12,vak(2,4)).
%bt(12,vak(3,3)).

%wizard level (should solve in 2 a 3 minutes)

%bt(1,vak(1,1)).
%bt(1,vak(1,2)).
%bt(1,vak(1,3)).
%bt(1,vak(2,3)).

%bt(6,vak(3,3)).
%bt(6,vak(4,3)).
%bt(6,vak(5,3)).
%bt(6,vak(4,4)).
%bt(6,vak(6,3)).

% random part of a first found random solution
%bt(11,vak(1,2)).
%bt(11,vak(1,3)). 
%bt(4,vak(1,4)). 
%bt(4,vak(1,5)). 
%bt(1,vak(1,6)). 
%bt(1,vak(1,7)). 
%bt(2,vak(1,8)). 
%bt(8,vak(1,9)). 
%bt(8,vak(1,10)).
%bt(8,vak(1,11)).
%bt(5,vak(2,1)).

% registreer de begintoestand en vul de overige vakjes met een willekeurig stuk (1..n hetgeen niet optimaal is maar goed)

% uncomment volgende twee regels indien gebruik maakt van begintoestand
%oc(X,Y) :- bt(N,vak(X,Y)).
%at(N, vak(X,Y)) :- bt(N,vak(X,Y)).

1{at(1..n, vak(X,Y))}1 :- X=1..dimX, Y=1..dimY, not oc(X,Y).

% stukken (zie https://www.smartgames.eu/nl/1-speler-spellen/iq-puzzler-pro, tabblad vervangstukken) 
% hebben een bepaalde vorm die nadere constraints vormen.
% We definieren die vorm aan de hand van het aantal vakjes dat een stuk mag bezetten en de eigenschap 
% of een vakje dat bezet is door een stuk ook een naburig vakje rechts naast dan wel onder 
% dat vakje heeft die ook door hetzelfde stuk bezet wordt, alsook te tellen hoe vaak dit
% voorkomt. Hulppredicaten:
hasXneighbour(N,X,Y) :- at(N, vak(X,Y)), at(N, vak(X+1,Y)).
hasYneighbour(N,X,Y) :- at(N, vak(X,Y)), at(N, vak(X,Y+1)).
hasneighbour(N,X,Y,1) :- hasXneighbour(N,X,Y).
hasneighbour(N,X,Y,2) :- hasYneighbour(N,X,Y).

% stuk 1 (SG 455-G) heeft 4 vakken aaneensluitend, met hooguit 3 op een rij met 4e haaks aan een uiteinde;
% dat betekend vooral dat andere configuraties (als bij stuk 3 en 4) uitgesloten dienen te worden
% *** *   * *   **   *  ** ***
%   * *   * *** *  ***   * *  
%     ** **     *        *
:- {at(1, V)}!=4.
:- {hasneighbour(1,X,Y,T)}!=3.
:- {hasXneighbour(1,X,Y)}>2.
:- {hasYneighbour(1,X,Y)}>2.
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y).
:- hasXneighbour(1,X,Y), hasXneighbour(1,X+1,Y), hasYneighbour(1,X+1,Y-1).
:- hasXneighbour(1,X,Y), hasXneighbour(1,X2,Y2), Y<Y2.
:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X,Y+1).
:- hasYneighbour(1,X,Y), hasYneighbour(1,X,Y+1), hasXneighbour(1,X-1,Y+1).
:- hasYneighbour(1,X,Y), hasYneighbour(1,X2,Y2), X<X2.

% stuk 2 (SG 455-I) heeft 3 vakken aaneensluitend maar niet 3 op een rij
% ** ** *   *
% *   * ** **
:- {at(2, V)}!=3.
:- {hasXneighbour(2,X,Y)}!=1.
:- {hasYneighbour(2,X,Y)}!=1.

% stuk 3 (SG 455-K) heeft 4 vakken aaneensluitend, met 3 op een rij met 4e haaks aan middelste
% ***  *   * *
%  *  *** ** **
%          * *
:- {at(3, V)}!=4.
:- {hasneighbour(3,X,Y,T)}!=3.
:- {hasXneighbour(3,X,Y)}>2.
:- {hasYneighbour(3,X,Y)}>2.
:- hasXneighbour(3,X,Y), hasXneighbour(3,X2,Y2), Y!=Y2.
:- hasYneighbour(3,X,Y), hasYneighbour(3,X2,Y2), X!=X2.
:- hasXneighbour(3,X,Y), hasXneighbour(3,X+1,Y), hasYneighbour(3,X,Y).
:- hasXneighbour(3,X,Y), hasXneighbour(3,X+1,Y), hasYneighbour(3,X,Y-1).
:- hasXneighbour(3,X,Y), hasXneighbour(3,X+1,Y), hasYneighbour(3,X+2,Y).
:- hasXneighbour(3,X,Y), hasXneighbour(3,X+1,Y), hasYneighbour(3,X+2,Y-1).
:- hasYneighbour(3,X,Y), hasYneighbour(3,X,Y+1), hasXneighbour(3,X,Y).
:- hasYneighbour(3,X,Y), hasYneighbour(3,X,Y+1), hasXneighbour(3,X-1,Y).
:- hasYneighbour(3,X,Y), hasYneighbour(3,X,Y+1), hasXneighbour(3,X,Y+2).
:- hasYneighbour(3,X,Y), hasYneighbour(3,X,Y+1), hasXneighbour(3,X-1,Y+2).

% stuk 4 (SG 455-D) heeft 4 vakken aaneensluitend met hooguit rijtjes van 2
% **   ** *   *
%  ** **  ** **
%          * *
:- {at(4, V)}!=4.
:- {hasneighbour(4,X,Y,T)}!=3.
:- {hasXneighbour(4,X,Y)}>2.
:- {hasYneighbour(4,X,Y)}>2.
:- hasXneighbour(4,X,Y), hasXneighbour(4,X,Y+1).
:- hasXneighbour(4,X,Y), hasXneighbour(4,X+1,Y).
:- hasYneighbour(4,X,Y), hasYneighbour(4,X,Y+1).
:- hasYneighbour(4,X,Y), hasYneighbour(4,X,Y+1).

% stuk 5 (SG 455-C) heeft 5 vakken aaneensluitend, met 4 op een rij met 5e haaks aan een uiteinde
%      *   *      **       **
% **** *   * *    *     *   * ****
%    * *   * **** *  ****   * *  
%      ** **      *         *
:- {at(5, V)}!=5.
:- {hasneighbour(5,X,Y,T)}!=4.
:- {hasXneighbour(5,X,Y)}==2.
:- {hasXneighbour(5,X,Y)}>3.
:- {hasYneighbour(5,X,Y)}>3.
:- hasXneighbour(5,X,Y), hasXneighbour(5,X2,Y2), Y!=Y2.
:- hasXneighbour(5,X,Y), hasXneighbour(5,X+1,Y), hasYneighbour(5,X+1,Y).
:- hasXneighbour(5,X,Y), hasXneighbour(5,X+1,Y), hasYneighbour(5,X+1,Y-1).
:- hasYneighbour(5,X,Y), hasYneighbour(5,X2,Y2), X!=X2.
:- hasYneighbour(5,X,Y), hasYneighbour(5,X,Y+1), hasXneighbour(5,X,Y+1).
:- hasYneighbour(5,X,Y), hasYneighbour(5,X,Y+1), hasXneighbour(5,X-1,Y+1).

% stuk 6 (SG 455-A) heeft 5 vakken aaneensluitend, met 4 op een rij met 5e haaks niet aan een uiteinde
%
% **** ****   *     *  *   * *   *
%   *   *    **** **** *   * ** **
%                      ** ** *   *
%                      *   * *   *
:- {at(6, V)}!=5.
:- {hasneighbour(6,X,Y,T)}!=4.
:- {hasXneighbour(6,X,Y)}==2.
:- {hasXneighbour(6,X,Y)}>3.
:- {hasYneighbour(6,X,Y)}>3.
:- hasXneighbour(6,X,Y), hasXneighbour(6,X2,Y2), Y!=Y2.
:- hasXneighbour(6,X,Y), hasXneighbour(6,X+1,Y), hasXneighbour(6,X+2,Y), hasYneighbour(6,X,Y).
:- hasXneighbour(6,X,Y), hasXneighbour(6,X+1,Y), hasXneighbour(6,X+2,Y), hasYneighbour(6,X,Y-1).
:- hasXneighbour(6,X,Y), hasXneighbour(6,X+1,Y), hasXneighbour(6,X+2,Y), hasYneighbour(6,X+3,Y).
:- hasXneighbour(6,X,Y), hasXneighbour(6,X+1,Y), hasXneighbour(6,X+2,Y), hasYneighbour(6,X+3,Y-1).
:- hasYneighbour(6,X,Y), hasYneighbour(6,X2,Y2), X!=X2.
:- hasYneighbour(6,X,Y), hasYneighbour(6,X,Y+1), hasYneighbour(6,X,Y+2), hasXneighbour(6,X,Y).
:- hasYneighbour(6,X,Y), hasYneighbour(6,X,Y+1), hasYneighbour(6,X,Y+2), hasXneighbour(6,X-1,Y).
:- hasYneighbour(6,X,Y), hasYneighbour(6,X,Y+1), hasYneighbour(6,X,Y+2), hasXneighbour(6,X,Y+3).
:- hasYneighbour(6,X,Y), hasYneighbour(6,X,Y+1), hasYneighbour(6,X,Y+2), hasXneighbour(6,X-1,Y+3).

% stuk 7 (SG 455-F) heeft 5 vakken aaneensluitend maar nooit meer dan 2 op een rij
%
% **   ** *     *  
%  ** **  **   ** 
%   * *    ** ** 
:- {at(7, V)}!=5.
:- {hasneighbour(7,X,Y,T)}!=4.
:- {hasXneighbour(7,X,Y)}!=2.
:- {hasYneighbour(7,X,Y)}!=2.
:- hasXneighbour(7,X,Y), hasYneighbour(7,X+1,Y-1), hasYneighbour(7,X,Y-1).
:- hasXneighbour(7,X,Y), hasXneighbour(7,X+1,Y).
:- hasYneighbour(7,X,Y), hasYneighbour(7,X,Y+1).

% stuk 8 (SG 455-H) heeft 5 vakken aaneensluitend met een verticaal en horizontaal rijtje van 3 vanuit hoekpunt
%
% *** *** *     *
% *     * *     *
% *     * *** ***
:- {at(8, V)}!=5.
:- {hasneighbour(8,X,Y,T)}!=4.
:- {hasXneighbour(8,X,Y)}!=2.
:- {hasYneighbour(8,X,Y)}!=2.
:- hasXneighbour(8,X,Y), hasXneighbour(8,X2,Y2), Y!=Y2.
:- hasYneighbour(8,X,Y), hasYneighbour(8,X2,Y2), X!=X2.
:- hasXneighbour(8,X,Y), hasXneighbour(8,X+1,Y), hasYneighbour(8,X+1,Y).
:- hasXneighbour(8,X,Y), hasXneighbour(8,X+1,Y), hasYneighbour(8,X+1,Y-1).
:- hasYneighbour(8,X,Y), hasYneighbour(8,X,Y+1), hasXneighbour(8,X,Y+1).
:- hasYneighbour(8,X,Y), hasYneighbour(8,X,Y+1), hasXneighbour(8,X-1,Y+1).

% stuk 9 (SG 455-E) heeft 5 vakken aaneensluitend met een rijtje van 3 en 2 aaneengeschakeld:
%		
% ***   *** *   *  * *
%   ** **   *   * ** **
%   ** **   ** ** *   *
% ***   ***  * *  *   *
:- {at(9, V)}!=5.
:- {hasneighbour(9,X,Y,T)}!=4.
:- {hasXneighbour(9,X,Y)}==0.
:- {hasXneighbour(9,X,Y)}==2.
:- {hasYneighbour(9,X,Y)}==0.
:- {hasYneighbour(9,X,Y)}==2.
:- hasXneighbour(9,X,Y), hasXneighbour(9,X+1,Y), hasXneighbour(9,X+2,Y).
:- hasYneighbour(9,X,Y), hasYneighbour(9,X,Y+1), hasYneighbour(9,X,Y+2).
:- hasXneighbour(9,X,Y), hasXneighbour(9,X+1,Y), hasYneighbour(9,X+1,Y).
:- hasYneighbour(9,X,Y), hasYneighbour(9,X,Y+1), hasXneighbour(9,X,Y+1).
:- hasXneighbour(9,X,Y), hasXneighbour(9,X+1,Y), hasYneighbour(9,X+1,Y-1).
:- hasYneighbour(9,X,Y), hasYneighbour(9,X,Y+1), hasXneighbour(9,X-1,Y+1).

% stuk 10 (SG 455-L) heeft 5 vakken aaneensluitend met een rijtje van 3 en 2 aaneengeschakeld:
%	
% *** ** ** * *
% * *  * *  ***
%     ** **
:- {at(10, V)}!=5.
:- {hasneighbour(10,X,Y,T)}!=4.
:- {hasXneighbour(10,X,Y)}!=2.
:- {hasYneighbour(10,X,Y)}!=2.
:- hasXneighbour(10,X,Y), hasYneighbour(10,X+1,Y-1), hasYneighbour(10,X,Y-1).
:- hasXneighbour(10,X,Y), hasXneighbour(10,X2,Y2), hasYneighbour(10,X3,Y3), hasYneighbour(10,X4,Y4), X!=X2, Y3!=Y4.
:- hasXneighbour(10,X,Y), hasXneighbour(10,X+1,Y), hasYneighbour(10,X+1,Y).
:- hasXneighbour(10,X,Y), hasXneighbour(10,X+1,Y), hasYneighbour(10,X+1,Y-1).
:- hasYneighbour(10,X,Y), hasYneighbour(10,X,Y+1), hasXneighbour(10,X,Y+1).
:- hasYneighbour(10,X,Y), hasYneighbour(10,X,Y+1), hasXneighbour(10,X-1,Y+1).

% stuk 11 (SG 455-J) heeft 5 vakken aaneensluitend met een blok van 4 met een vakje eraan geplakt
%
% **
% ***
:- {at(11, V)}!=5.
:- {hasneighbour(11,X,Y,T)}!=5.


% stuk 12 (SG 455-B) heeft 5 vakken aaneensluitend in specifieke configuratie
%   * **   *   *  *    **  *   *
% ***  ** *** **  *** **  ***  **
%  *   *  *    **  *   *    * **
:- {at(12, V)}!=5.
:- {hasneighbour(12,X,Y,T)}!=4.
:- {hasXneighbour(12,X,Y)}!=2.
:- {hasYneighbour(12,X,Y)}!=2.
% geen blokvorming
:- hasXneighbour(12,X,Y), hasYneighbour(12,X+1,Y-1), hasYneighbour(12,X,Y-1).

% geen 2 rijtjes van 2
:- hasXneighbour(12,X,Y), hasXneighbour(12,X+1,Y), hasYneighbour(12,X2,Y2), hasYneighbour(12,X2,Y2+1).

% geen stuk 7 vorm
:- hasXneighbour(12,X,Y), hasXneighbour(12,X+1,Y+1), hasYneighbour(12,X2,Y2), hasYneighbour(12,X2+1,Y2+1).
:- hasXneighbour(12,X,Y), hasXneighbour(12,X-1,Y+1), hasYneighbour(12,X2,Y2), hasYneighbour(12,X2+1,Y2-1).

% geen vormen met alleen haken aan uiteinden
:- hasXneighbour(12,X,Y), hasXneighbour(12,X+1,Y), hasYneighbour(12,X,Y), hasYneighbour(12,X+2,Y).
:- hasXneighbour(12,X,Y), hasXneighbour(12,X+1,Y), hasYneighbour(12,X,Y), hasYneighbour(12,X+2,Y-1).
:- hasXneighbour(12,X,Y), hasXneighbour(12,X+1,Y), hasYneighbour(12,X,Y), hasYneighbour(12,X,Y-1).
:- hasXneighbour(12,X,Y), hasXneighbour(12,X+1,Y), hasYneighbour(12,X+2,Y), hasYneighbour(12,X+2,Y-1).
:- hasXneighbour(12,X,Y), hasXneighbour(12,X+1,Y), hasYneighbour(12,X+2,Y), hasYneighbour(12,X,Y-1).
:- hasXneighbour(12,X,Y), hasXneighbour(12,X+1,Y), hasYneighbour(12,X+2,Y-1), hasYneighbour(12,X,Y-1).

:- hasYneighbour(12,X,Y), hasYneighbour(12,X,Y+1), hasXneighbour(12,X,Y), hasXneighbour(12,X,Y+2).
:- hasYneighbour(12,X,Y), hasYneighbour(12,X,Y+1), hasXneighbour(12,X,Y), hasXneighbour(12,X-1,Y+2).
:- hasYneighbour(12,X,Y), hasYneighbour(12,X,Y+1), hasXneighbour(12,X,Y), hasXneighbour(12,X-1,Y).
:- hasYneighbour(12,X,Y), hasYneighbour(12,X,Y+1), hasXneighbour(12,X,Y+2), hasXneighbour(12,X-1,Y+2).
:- hasYneighbour(12,X,Y), hasYneighbour(12,X,Y+1), hasXneighbour(12,X,Y+2), hasXneighbour(12,X-1,Y).
:- hasYneighbour(12,X,Y), hasYneighbour(12,X,Y+1), hasXneighbour(12,X-1,Y+2), hasXneighbour(12,X-1,Y).

placed(N) :- at(N, vak(X,Y)).
:- {placed(N)}!=n.
