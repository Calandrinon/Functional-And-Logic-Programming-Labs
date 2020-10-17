/*
    13.        
    a. Transform a list in a set, in the order of the last occurrences of elements. 
       Eg.: [1,2,3,1,2] is transformed in [3,1,2].
    b. Define a predicate to determine the greatest common divisor of all numbers in a list.
*/


%---------------------------------  a  -------------------------------------

reverse([], C, C).
reverse([H|T], Rev, C) :-
    reverse(T, Rev, [H|C]).


inner_lts([], C, C). 
inner_lts([H|T], Set, C) :- not(member(H, C)), inner_lts(T, Set, [H | C]), !.
inner_lts([_|T], Set, C) :- inner_lts(T, Set, C), !.


list_to_set(List, Set) :-    
    reverse(List, Rev),
    inner_lts(Rev, Set, []).

%---------------------------------  b  -------------------------------------
    
