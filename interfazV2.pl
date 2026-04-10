:- use_module(library(pce)).

partido :-
	new(Ventana, dialog('Partido')),
	new(E1, text_item('Equipo 1')),
	new(Gol1, int_item('Goles anotados')),
	new(E2, text_item('Equipo 2')),
	new(Gol2, int_item('Goles anotados')),
	new(B, button(resultado,
			 message(@prolog, result,
				 E1?selection, Gol1?selection, E2?selection, Gol2?selection))),
	new(BotonSalir, button(salir, message(Ventana, destroy))),
	send(Ventana, append, E1),
	send(Ventana, append, Gol1),
	send(Ventana, append, E2),
	send(Ventana, append, Gol2),
	send(Ventana, append, B),
	send(Ventana, append, BotonSalir),
	send(Ventana, open).

result (Eq1,G1,Eq2,G2) :-
write ('Equipo '),
write (Eq1),write(' con '),write(G1),writeln(' goles '),
write(' Contra ') , write ('Equipo '), write(Eq2),
write(' con '),write(G2),writeln(' goles.'), (G1> G2),
(write(' El ganador es Equipo '), writeln(Eq1),nl);
(write(' El ganador es Equipo ') , writeln(Eq2),nl).