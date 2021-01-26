%% sum(List, Res).
sum([], 0).
sum([H|T], Res) :-
	sum(T, Res2),
	Res is H + Res2.
