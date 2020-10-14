/*
    13.        
    a. Transform a list in a set, in the order of the last occurrences of elements. 
       Eg.: [1,2,3,1,2] is transformed in [3,1,2].
    b. Define a predicate to determine the greatest common divisor of all numbers in a list.
*/

reverse([], Acc, Acc).
reverse([H|T], Rev, Acc) :-
    reverse(T, Rev, [H|Acc]).


inner_lts([], Acc, Acc). 
inner_lts([H|T], Set, Acc) :- 
    not(member(H, Acc)) -> inner_lts(T, Set, [H | Acc]);
    inner_lts(T, Set, Acc). 


list_to_set(List, Set) :-    
    reverse(List, Rev),
    inner_lts(Rev, Set, []).