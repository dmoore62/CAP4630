show(Size, List) :- writelist(['Board Position:']), makerow(Size, 1, List).

makerow(S, N, L) :- N > S, !.
makerow(S, N, L) :- N =< S, makecol(S, N, 1, L), nl, N1 is N + 1, makerow(S, N1, L).

makecol(S, R, N, L) :- N > S, !.
makecol(S, R, N, L) :- N =< S, writecell(R, N, L), N1 is N + 1, makecol(S, R, N1, L).

writelist([]):-nl.
writelist([H|T]):-print(H), tab(1), writelist(T). 

writecell([]):-tab(1).
writecell([H|T]):-print(H), writecell(T).

writecell(R, C, L):-findpiece(R, C, L).

findpiece(R, C, []):-write('--'), tab(1).
findpiece(R, C, [H|T]):-matchpiece(R, C, H, T).

matchpiece(R, C, [P, X, Y], T):-not(R=X), not(C=Y), findpiece(R, C, T).
matchpiece(R, C, [P, X, Y], T):-not(R=X), C=Y, findpiece(R, C, T).
matchpiece(R, C, [P, X, Y], T):-R=X, not(C=Y), findpiece(R, C, T).
matchpiece(R, C, [P, X, Y], T):-R=X, C=Y, print(P), tab(1).
