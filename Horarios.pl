% Declaramos el predicado como dinámico para poder usar assert y retract.
:- dynamic clase/3.

% --- HORARIO INICIAL (Lunes a Miércoles) ---
% Notas de los bloques de hora:
% 1 = 8:00 a 9:40 am
% 2 = 10:00 a 11:40 am
% 3 = 1:00 a 2:40 pm
% 4 = 3:00 a 4:40 pm

% Lunes
clase('Mantenimiento de PC II', lunes, 1).
clase('Programacion Logica', lunes, 2).

% Martes
clase('Medios y protocolos', martes, 1).
clase('Programacion web', martes, 2).

% Miercoles
clase('Programacion Logica', miercoles, 2).
clase('Administracion estrategica', miercoles, 3).

% --- RUTINA DE ACTUALIZACIÓN ---
% Este predicado ejecuta todos los pasos que solicitaste de forma secuencial.
gestionar_horario :-
    nl, write('--- 1. HORARIO INICIAL (LUNES A MIERCOLES) ---'), nl,
    listing(clase),
    
    write('--- 2. AGREGANDO CLASES DE JUEVES Y VIERNES ---'), nl,
    % Agregamos las clases del jueves con assertz (para que se añadan al final)
    assertz(clase('Medios y protocolos', jueves, 2)),
    assertz(clase('Mantenimiento de PC II', jueves, 3)),
    assertz(clase('Programacion web', jueves, 4)),
    % Como el viernes no hay clases, no agregamos ningún hecho.
    write('Clases de jueves agregadas con exito (Viernes libre).'), nl, nl,
    
    write('--- 3. ELIMINANDO CLASES ESPECIFICAS ---'), nl,
    % Eliminamos la clase del jueves de 1 a 2:40 pm (hora = 3)
    retract(clase(_, jueves, 3)),
    write('Clase del jueves a la 1:00 pm eliminada.'), nl,
    
    % Eliminamos la clase del miercoles de 10 a 11:40 am (hora = 2)
    retract(clase(_, miercoles, 2)),
    write('Clase del miercoles a las 10:00 am eliminada.'), nl, nl,
    
    write('--- 4. HORARIO FINAL ACTUALIZADO ---'), nl,
    listing(clase).