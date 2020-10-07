is_member([H|T], X) :- 
    H is X -> true;
    is_member(T, X).

is_member([], X) :- false.


list_length([], 0).
list_length([H|T], L) :- list_length(T, L2), L is L2 + 1.