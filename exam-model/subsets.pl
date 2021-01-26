subset([], []).
subset([H|T], Res) :-
	subset(T, Res2),
	Res = [H | Res2].
subset([_|T], Res) :-
	subset(T, Res2),
	Res = Res2.
