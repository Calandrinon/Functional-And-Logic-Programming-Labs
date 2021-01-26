% Sfaturi Gabi
% Daca facem punctu 2 si punctu 3 suntem chill
%
%
elem([E|_], E).
elem([_|T], E) :- elem(T,E).

sterge([E|R], E, R) :- !.
sterge([H|T], E, [H|R]) :- sterge(T,E,R).

perm([],[]).
perm(L, [E|RR]):-elem(L,E), sterge(L,E,R),perm(R,RR).

subm([],[]).
subm([H|T],[H|R]):-subm(T, R).
subm([_|T], R):-subm(T, R).

comb([],0,[]).
comb([H|T],K,[H|R]):-
    K1 is K-1,
    comb(T,K1,R).
comb([_|T],K,R):-comb(T,K,R).


aranj(L,K,RR):-comb(L,K,R), perm(R,RR).


% f([], -1).
% f([H|T], S) :- f(T, S1), S1>0, !, S is S1+H.
% f([_|T], S) :- f(T, S1), S is S1.

f([], -1).
f([H|T], S) :- f(T, S1), ff(S1,S,H).

ff(S1,S,H) :- S1>0, !, S is S1+H.
ff(S1,S,_) :- S is S1.

`