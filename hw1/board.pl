show(Size, List) :- writelist(['Board Position:']), makerow(Size, 1).

makerow(S, N) :- N > S, !.
makerow(S, N) :- N =< S, makecol(S, N, 1), nl, N1 is N + 1, makerow(S, N1).

makecol(S, R, N) :- N > S, !.
makecol(S, R, N) :- N =< S, writecell([R, N]), N1 is N + 1, makecol(S, R, N1).

writelist([]):-nl.
writelist([H|T]):-print(H), tab(1), writelist(T). 

writecell([]):-tab(1).
writecell([H|T]):-print(H), writecell(T).
