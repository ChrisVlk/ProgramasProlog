:-use_module(library(pce)).

t1:-new(D,dialog('Primera')), send(D, open).

t2:-new(D,dialog('Segunda')), 
    send(D, append, button(bienvenido)),
    send(D,open).

t3:-new(D, dialog('Tercera')),
    send(D,append, button(bienvenido, message(@prolog,eliminado,D))),
    send(D,open).
    eliminado(D):- send(D, destroy).

t4:-new(D,dialog('Cuarta')),
    send(D,append,text item(bienvenido,'astute')),
    send(D,open).

t5:-new(D,dialog('Quinta')),
    new(T,text item(bienvenido)),
    sned(D,open).

t6:-new(D,dialog('Sexta')),
    new(T,text item('a la clase')),
    send(D,append,T),
    send(T,value,'astute'),
    send(D,open),
    get(T,value,Text),
    writeln(Text).

tranaja:-new(D,dialog('Mira esto')),
        new(T,text item(saluda)),
        send(D,append,T),
        send(D,append,button(mostrar,message(@prolog,captura,T))),
        send(D,append,button(salir,message(@prolog,envia,D))),
        send(D,open).

    captura(T):- get(T,value,Text), writeln(Text).

    envia(D):- send(D,destroy).

