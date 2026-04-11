:- use_module(library(pce)).

inicio:-
    % 1. Crear la ventana principal
    new(Ventana, dialog('Calculo de Factorial')),
    
    % 2. Crear los campos de texto
    new(Entrada, text_item('Ingrese un numero')),
    new(Salida, text_item('Resultado')),
    
    % 3. Crear los botones
    new(BtnFac, button('Calcular Factorial', 
        message(@prolog, calcular_factorial, Entrada?selection, Salida))),
        
    new(BtnLimpiar, button('Limpiar', and(
        message(Entrada, clear),
        message(Salida, clear)))),
        
    new(BtnSalir, button('Salir', and(
        message(Ventana, destroy),
        message(Ventana, free)))),
        
    % 4. Agregar los elementos a la ventana
    send(Ventana, append, Entrada),
    send(Ventana, append, Salida),
    send(Ventana, append, BtnFac),
    send(Ventana, append, BtnLimpiar),
    send(Ventana, append, BtnSalir),
    
    % 5. Mostrar la ventana
    send(Ventana, open).

% --- Lógica de Prolog para el Factorial ---
calcular_factorial(DatoIngresado, ObjetoSalida) :-
    atom_number(DatoIngresado, N), % Convierte el texto ingresado a número
    factorial(N, Resultado),
    send(ObjetoSalida, selection, Resultado). % Envía el resultado al text_item

% Reglas matemáticas del factorial
factorial(0, 1).
factorial(N, F) :- 
    N > 0, 
    N1 is N - 1, 
    factorial(N1, F1), 
    F is N * F1.