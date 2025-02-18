progenitor(pietro, joao).
progenitor(pietro, clara).
progenitor(pietro, francisco).
progenitor(pietro, valeria).
progenitor(pietro, ana).

progenitor(antonita, joao).
progenitor(antonita, clara).
progenitor(antonita, francisco).
progenitor(antonita, valeria).
progenitor(antonita, ana).

progenitor(joao, mario).
progenitor(ana, helena).
progenitor(ana, joana).

progenitor(mario, carlos).
progenitor(helena, carlos).

progenitor(clara, pietro_jr).
progenitor(clara, enzo).

progenitor(jacynto, francisca).
progenitor(jacynto, antonia).
progenitor(claudia, francisca).
progenitor(claudia, antonia).

sexo(pietro, masculino).
sexo(joao, masculino).
sexo(francisco, masculino).
sexo(mario, masculino).
sexo(carlos, masculino).
sexo(pietro_jr, masculino).
sexo(enzo, masculino).
sexo(jacynto, masculino).

sexo(antonita, feminino).
sexo(clara, feminino).
sexo(valeria, feminino).
sexo(ana, feminino).
sexo(helena, feminino).
sexo(joana, feminino).
sexo(fabiana, feminino).
sexo(francisca, feminino).
sexo(antonia, feminino).
sexo(claudia, feminino).

avo(X, Y) :- progenitor(X, Z), progenitor(Z, Y), sexo(X, masculino).
avoa(X, Y) :- progenitor(X, Z), progenitor(Z, Y), sexo(X, feminino).

irmao(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \= Y, sexo(X, masculino).
irma(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \= Y, sexo(X, feminino).

tio(X, Y) :- irmao(X, Z), progenitor(Z, Y).
tia(X, Y) :- irma(X, Z), progenitor(Z, Y).

primo(X, Y) :- progenitor(Z, X), irmao(Z, W), progenitor(W, Y), sexo(X, masculino).
primo(X, Y) :- progenitor(Z, X), irma(Z, W), progenitor(W, Y), sexo(X, masculino).
prima(X, Y) :- progenitor(Z, X), irmao(Z, W), progenitor(W, Y), sexo(X, feminino).
prima(X, Y) :- progenitor(Z, X), irma(Z, W), progenitor(W, Y), sexo(X, feminino).

descendente(X, Y) :- progenitor(Y, X).
descendente(X, Y) :- progenitor(Y, Z), descendente(X, Z).

ascendente(X, Y) :- descendente(Y, X).