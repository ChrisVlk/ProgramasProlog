% --- BASE DE CONOCIMIENTOS ---
% Lista de mas de 10 juegos. 
lista_inicial([mario, zelda, pacman, tetris, fifa, crash, doom, halo, resident_evil ,minecraft, mario2]).

% 1. Determinar si un videojuego corresponde a la lista.
pertenece(Videojuego) :-
    lista_inicial(Lista),
    member(Videojuego, Lista).

% 2. Agregar un videojuego (incluso ya repetido) a su lista.
% Usamos append para pegarlo al final
agregar(VideojuegoNuevo, NuevaLista) :-
    lista_inicial(Lista),
    append(Lista, [VideojuegoNuevo], NuevaLista).

% 3. Determinar las veces que aparece un videojuego X en la lista.
contar_veces(VideojuegoX, Cantidad) :-
    lista_inicial(Lista),
    findall(VideojuegoX, member(VideojuegoX, Lista), Coincidencias),
    length(Coincidencias, Cantidad).

% 4. Borrar X videojuego de su lista.
% Usamos "delete", borra todas las veces que aparezca ese juego
borrar_juego(VideojuegoX, NuevaLista) :-
    lista_inicial(Lista),
    delete(Lista, VideojuegoX, NuevaLista).

% 5. Borrar videojuego ubicado en la posición N de la lista.
borrar_posicion(PosicionN, NuevaLista) :-
    lista_inicial(Lista),
    borrar_indice(PosicionN, Lista, NuevaLista).

% Reglas auxiliares para el Punto 5
borrar_indice(0, [_|Cola], Cola).
borrar_indice(N, [Cabeza|Cola], [Cabeza|Resto]) :-
    N > 0,
    N1 is N - 1,
    borrar_indice(N1, Cola, Resto).