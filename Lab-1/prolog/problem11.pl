is_member([], _) :- false.
is_member([H|_], X) :- H is X, true, !.
is_member([_|T], X) :- is_member(T, X).


list_length([], 0).
list_length([_|T], L) :- list_length(T, L2), L is L2 + 1.