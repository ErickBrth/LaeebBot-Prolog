selecoes(R):- R = (["1- Brasil", "2- Alemenha", "3- Argentina", "4- Belgica",
                 "5- Holanda", "6- Inglaterra", "7- Franca", "8- Espanha", "9- Portugal",
                 "10- Croacia", "11- Uruguai", "12- Dinamarca", "13- servia", "14- suica",
                 "15- ira", "16- coreia do sul"]),
                 write(R).
randseq(16, 93, ValorSelecoes).

mostra_selecoes() :- 
    selecoes(R).

define_acao(Option) :-
    (mostra_selecoes() -> Option =:= 1).
    /*saldo(R) -> Option =:= 2;*/
    /*recarregar(R) -> Option =:= 3;*/
    /*apostar(R) -> Option =:= 4),*/


main:-
    write("Selecione:"), nl,
    write("1- ver selecoes"), nl,
    write("2- ver saldo"), nl,
    write("3- recarregar o saldo"), nl,
    write("4- Apostar"), nl,
    read(Option),
    define_acao(Option),halt.
