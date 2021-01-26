
subset([],[]).
subset([H|T],Res) :-
    subset(T, Res2),
    Res = [H | Res2].
subset([_|T],Res) :-
    subset(T, Res).

is_member([H|_], H).
is_member([_|T], X) :- is_member(T, X).


remEl([], _, []).
remEl([H|T], H, Res) :-
    remEl(T, H, Res), !.

remEl([H|T], X, Res) :-
    remEl(T, X, Res2),
    Res = [H | Res2].


perm([], []).
perm(List, Res) :-
    is_member(List, X),
    remEl(List, X, Res2),
    perm(Res2, Res3),
    Res = [X | Res3].


arr([], _, []).
arr(List, K, Res) :-
    subset(List, Sub),
    length(Sub, K),
    perm(Sub, Res2),
    Res = Res2.

prod([], 1).
prod([H|T], Res) :-
    prod(T, Res2),
    Res is H * Res2.
arrP([], _, _, []).
arrP(List, K, P, Res) :-
    arr(List, K, Arr),
    prod(Arr, P),
    Res = Arr.

arrWr(List, K, P, Res) :-
    findall(R, arrP(List, K, P, R), Res).

lastst([X], X).
lastst([_|T], X) :-
    lastst(T, X).