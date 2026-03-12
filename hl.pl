progenitor(maria,carla).
progenitor(maria,pedro).
progenitor(maria,violeta).
progenitor(maria,rosman).

% Agregamos más hechos para una familia más completa
progenitor(juan,carla).
progenitor(juan,pedro).
progenitor(juan,violeta).
progenitor(juan,rosman).

progenitor(carla,ana).
progenitor(carla,luis).

progenitor(pedro,marta).
progenitor(pedro,jorge).

% Géneros
hombre(juan).
hombre(pedro).
hombre(luis).
hombre(jorge).
hombre(rosman).

mujer(maria).
mujer(carla).
mujer(violeta).
mujer(ana).
mujer(marta).

% Reglas
padre(X,Y) :- progenitor(X,Y), hombre(X).
madre(X,Y) :- progenitor(X,Y), mujer(X).

abuelo(X,Y) :- progenitor(X,Z), progenitor(Z,Y), hombre(X).
abuela(X,Y) :- progenitor(X,Z), progenitor(Z,Y), mujer(X).

% Para consultar:
% ?- padre(X,carla).  % Quién es el padre de Carla
% ?- madre(X,carla).  % Quién es la madre de Carla
% ?- abuelo(X,ana).   % Quién es el abuelo de Ana
% ?- abuela(X,ana).   % Quién es la abuela de Ana
% ?- progenitor(X,Y). % Todos los progenitores