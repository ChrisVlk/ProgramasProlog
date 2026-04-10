:- use_module(library(pce)).

prueba2:- 
    new(Ventana,dialog('Sumar')),
    new(Item1,text_item('valor_1')),
    new(Item2,text_item('valor_2')),
    new(Total,text_item('Total')),
    new(B1,button('Resultado',message(@prolog,suma,Item1?selection,Item2?selection,Total))),
    new(@boton,button('Salir',and(message(Ventana,destroy),
        message(Ventana,free),
        message(Item1,free),
        message(Item2,free),
        message(B1,free),
        message(@boton,free)))),
    send(Ventana,append(Item1)),
    send(Ventana,append(Item2)),
    send(Ventana,append(Total)),
    send(Ventana,append(B1)),
    send(Ventana,append(@boton)),
    send(Ventana,open).

suma(X,Y,R):-F=X+Y,send(R,selection,F).