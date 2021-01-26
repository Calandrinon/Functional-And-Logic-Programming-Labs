fo([], -1).
fo([H|T], S) :- H > 0, fo(T, S1), S1 < H, !, S is H.	
fo([_|T], S) :- fo(T, S1), S is S1.	





f([], -1).
f([H|T], S) :- f(T, S1), f2(H, S, S1).	
f2(H, S, S1) :- H > 0, S1 < H, !, S is H.
f2(_, S, S1) :- S is S1.	
