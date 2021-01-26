
f([], 0).
f([H|T], S) :- f(T, S1), S1 < H, !, S is H.
f([_|T], S) :- f(T, S1), S is S1.

f2([], 0).
f2([H|T], S) :- f2(T, S1), ff(S1,S,H).

ff(S1,S,H) :- S1 < H, !, S is H.
ff(S1,S,_) :- S is S1.



f3([], []).
f3([H|T], S) :-
    H mod 2 =:= 0,
    f3(T, S).
f3([H|T], [H|S]) :-
    f3(T, S).

remEl([], _, []).
remEl([H|T], H, Res) :-
    remEl(T, H, Res),
    !.
remEl([H|T], X, Res) :-
    remEl(T, X, Res2),
    Res = [H | Res2].

is_member([H|_], H).
is_member([_|T], X) :-
    is_member(T, X).

perm([], []).
perm(List, Res) :-
    is_member(List, X),
    remEl(List, X, Res2),
    perm(Res2, Res3),
    Res = [X | Res3].

absval(X, Res) :-
    X < 0,
    !,
    Res is X * -1.
absval(X, Res) :-
    X > 0,
    !,
    Res = X.

diff3([_]) :- !.
diff3([H1, H2|T]) :-
    Diff is H1 - H2,
    absval(Diff, AbsDiff),
    AbsDiff =< 3,
    !,
    diff3([H2|T]).


gen([], []). 
gen(List, Res) :-
    perm(List, Perm),
    diff3(Perm),
    Res = Perm.

genWrapper(List, Res) :-
    findall(R, gen(List, R), Res).
