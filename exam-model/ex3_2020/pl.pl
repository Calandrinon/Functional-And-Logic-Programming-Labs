subset([], []).
subset([H|T], Res) :-
    subset(T, Res2),
    Res = [H | Res2].
subset([_|T], Res) :-
    subset(T, Res).



is_member([H|_], H).
is_member([_|T], X) :-
    is_member(T, X).


remEl([], _, []).
remEl([H|T], H, Res) :-
    remEl(T, H, Res).

remEl([H|T], X, Res) :-
    remEl(T, X, Res2),
    Res = [H|Res2].


perm([], []).
perm(List, Res) :-
    is_member(List, X),
    remEl(List, X, Res2),
    perm(Res2, Res3),
    Res = Res3.



arr([], _, []).
arr(List, K, Res) :-
    subset(List, Sub),
    length(Sub, K),
    perm(Sub, Res).

arrangements([], _, []).
arrangements(List, K, Res) :-
    subset(List, Set),
    length(Set, K),
    perm(Set, Res).


prod([], 1).
prod([H|T], Res) :-
    prod(T, Res2),
    Res is H * Res2.

arrV(List, K, V, Res) :-
    arr(List, K, Arr),
    prod(Arr, Prod),
    Prod < V,
    Res = Arr.
