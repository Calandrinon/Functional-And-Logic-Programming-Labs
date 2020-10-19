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


list_to_set([], C, C). 
list_to_set([H|T], Set, C) :- not(member(H, C)), list_to_set(T, Set, [H | C]), !.
list_to_set([_|T], Set, C) :- list_to_set(T, Set, C), !.


list_to_set(List, Set) :-    
    reverse(List, Rev),
    list_to_set(Rev, Set, []).

%---------------------------------  b  -------------------------------------
    
gcd(A, B, B) :- A mod B =:= 0.
gcd(A, B, Result) :- NewDivisor is A mod B, gcd(B, NewDivisor, Result2), Result is Result2, !.

gcd_list([], 0).
gcd_list([A], A).
gcd_list([A, B], Result) :- gcd(A, B, Result), !.
gcd_list([H1, H2|T], Result) :- gcd(H1, H2, NewH), gcd_list([NewH|T], Result2), Result is Result2. 
