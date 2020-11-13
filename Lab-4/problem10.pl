/**
 * For a list a1...an with distinct integer numbers, define a predicate to determine all subsets with sum of elements divisible with n.
 * **/

subset([], []).
subset([H|T], Res) :-
  subset(T, Res2),
  Res = [H | Res2].
subset([_|T], Res) :-
  subset(T, Res).

sum([], 0).
sum([H|T], Res) :-
  sum(T, Res2),
  Res is Res2 + H.

divSumSubset([], _, []).
divSumSubset([H|T], E, Res) :-
  subset([H|T], Subset),
  sum(Subset, Sum),
  Sum mod E =:= 0,
  Res = Subset.
  
divSumSubsetWrapper(List, E, R) :-
  findall(Res, divSumSubset(List, E, Res), R).