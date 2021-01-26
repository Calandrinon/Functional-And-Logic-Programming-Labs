subset([], []).
subset([H|T], Res) :-
    subset(T, Res2),
    Res = [H | Res2].
subset([_|T], Res) :-
    subset(T, Res2),
    Res = Res2.

is_member([H|_], H).
is_member([_|T], X) :-
    is_member(T, X).

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

arrangements([], _).
arrangements(List, K, Res) :-
    subset(List, Res1),
    length(Res1, K),
    perm(Res1, Res2),
    Res = Res2.

prod([], 1).
prod([H|T], Res) :-
    prod(T, Res2),
    Res is H * Res2.


arrV([], _, _, []).
arrV(List, V, K, Res) :-
    arrangements(List, K, Res2),
    prod(Res2, Res3),
    Res3 < V,
    Res = Res2.
arrVWrapper(List, V, K, Res) :-
    findall(R, arrV(List, V, K, R), Res).




f([], 0).
f([H|T], S) :-
    f(T, S1),
    S1 is S - H.
