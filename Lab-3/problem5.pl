/**
 *      5.  
 *          a. Substitute all occurrences of an element of a list with all the elements of another list. 
 *             Eg. subst([1,2,1,3,1,4],1,[10,11],X) produces X=[10,11,2,10,11,3,10,11,4].
 *
 *          b. For a heterogeneous list, formed from integer numbers and lists of numbers, replace in every sublist all occurrences 
 *             of the first element from the sublist with the new given list. 
 *             Eg.: [1, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1,1], 7] and [11, 11] 
 *                      =>
 *                  [1, [11, 11, 1, 11, 11], 3, 6, [11, 11, 10, 1, 3, 9], 5, [11 11 11 11 11 11], 7]
 * **/

bind_lists([], L, L). % bind_lists(I, I, O)
bind_lists([H|T], L, [H|M]) :- bind_lists(T, L, M).

subst([], _, _, []). % subst(I, I, I, O)
subst([H|T], E, OtherList, Res) :- H = E, subst(T, E, OtherList, Res2), !, bind_lists(OtherList, Res2, GluedLists), Res = GluedLists.
subst([H|T], E, OtherList, Res) :- H \= E, subst(T, E, OtherList, Res2), !, Res = [H|Res2].




first_occurence_subst([], _, []). %first_occurence_subst(I, I, O)
first_occurence_subst([H|T], OtherList, Res) :- 
    is_list(H),
    H = [H1 | _],
    subst(H, H1, OtherList, Subres),
    first_occurence_subst(T, OtherList, Res2),
    !,
    Res = [Subres | Res2].

first_occurence_subst([H|T], OtherList, Res) :- 
    number(H),
    first_occurence_subst(T, OtherList, Res2),
    !,
    Res = [H | Res2].