:- use_module(library(pce)).

inicio1:-
    new(Ventana, dialog('Factorial y Gauss')),
    new(Entrada, text_item('Ingrese un numero')),
    new(Salida, text_item('Resultado')),
    
    new(BtnFac, button('Factorial', 
        message(@prolog, calcular_factorial, Entrada?selection, Salida))),
        
    % AQUI ESTA LA MODIFICACION: Se agrega el botón Gauss
    new(BtnGauss, button('Gauss', 
        message(@prolog, calcular_gauss, Entrada?selection, Salida))),
    
    new(BtnLimpiar, button('Limpiar', and(
        message(Entrada, clear),
        message(Salida, clear)))),
        
    new(BtnSalir, button('Salir', and(
        message(Ventana, destroy),
        message(Ventana, free)))),
        
    send(Ventana, append, Entrada),
    send(Ventana, append, Salida),
    send(Ventana, append, BtnFac),
    send(Ventana, append, BtnGauss), % Se "pega" el nuevo botón a la ventana
    send(Ventana, append, BtnLimpiar),
    send(Ventana, append, BtnSalir),
    
    send(Ventana, open).

% --- Lógica de Prolog ---
% (La lógica del factorial se mantiene exactamente igual que en el Ejercicio 5)
calcular_factorial(DatoIngresado, ObjetoSalida) :-
    atom_number(DatoIngresado, N),
    factorial(N, Resultado),
    send(ObjetoSalida, selection, Resultado).

factorial(0, 1).
factorial(N, F) :- N > 0, N1 is N - 1, factorial(N1, F1), F is N * F1.

% AQUI ESTA LA NUEVA LOGICA: El cálculo de Gauss
calcular_gauss(DatoIngresado, ObjetoSalida) :-
    atom_number(DatoIngresado, N),
    Resultado is (N * (N + 1)) // 2,
    send(ObjetoSalida, selection, Resultado).