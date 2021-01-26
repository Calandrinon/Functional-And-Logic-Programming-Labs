f([], -1).
f([H|T], S) :- f(T, S1), S1 > 0, !, S is S1+H.
f([H|T], S) :- f(T, S1), S is S1+H.


list2set([], C, C).
list2set([H|T], Set, C) :- not(member(H,C)), !, list2set(T, Set, [H|C]).
list2set([_|T], Set, C) :- list2set(T, Set, C).


set([], []).
% here we say that if the head is in the tail of the list
% we discard the head and create a set with the tail
% the exclamation mark is a "cut" which means that if member(H, T) was true
% prolog cannot backtrack from set([H|T], X) to set([H|T], [H|X]).
% this prevents giving extra answers that aren't sets, try removing it. 
set([H|T], X):- member(H, T), !, set(T, X).
% and here we say that if the previous clause didn't match because
% head is not a member of tail then we create a set of the tail adding head.
set([H|T], [H|X]):- set(T, X).




set2([], []).
set2([H|T], X):- member(H, T), !, set2(T, X).
set2([H|T], X):- set2(T, X2), X = [H|X2].


subset([], []).
subset([H|T], Set) :-
    subset(T, Set2),
    Set = [H | Set2].
subset([_|T], Set) :-
    subset(T, Set).


prod([], 1).
prod([H|T], P) :-
    prod(T, P2),
    P is P2 * H.

is_member([X|_], X). 
is_member([_|T], X) :- 
    is_member(T, X).


remEl([], _, []).
remEl([X|T], X, L):- remEl(T, X, L), !.
remEl([H|T], X, [H|L]):- remEl(T, X, L).

perm([],[]).
perm(L, R):-
    is_member(L,E),
    remEl(L, E, R2),
    perm(R2,R3), 
    R = [E | R3].

permWrapper(L, Res) :-
    findall(R,perm(L, R),Res).


arrangements([], _, _, []).
arrangements(List, K, P, Res) :-
    subset(List, Set),
    length(Set, K),
    prod(Set, P),
    perm(Set, Res).

arrWrapper(List, K, P, Res) :-
    findall(R, arrangements(List, K, P, R), Res).


combs([], _, []).
combs(List, K, Res) :-
    subset(List, Set),
    length(Set, K),
    Res = Set.
combsWrapper(List, K, Res) :-
    findall(R,combs(List, K, R),Res).













