selecoes(R):- R = (["","1- Brasil", "2- Alemenha", "3- Argentina", "4- Belgica",
                 "5- Holanda", "6- Inglaterra", "7- Franca", "8- Espanha", "9- Portugal",
                 "10- Croacia", "11- Uruguai", "12- Dinamarca", "13- servia", "14- suica",
                 "15- ira", "16- coreia do sul"]).

/*lista com os valores das selecoes*/
valor_selecoes(R):- R = ([0.0,9.2, 9.3, 9.0, 9.2, 8.9, 8.8, 9.4, 8.7, 9.1, 8.5, 8.4, 8.7, 8.0, 8.8, 7.5, 7.7]).                  

randseq(List) :- 
      randset(16, 93, Set),
      random_permutation(Set, List).

imprime_selecoes([]).
imprime_selecoes([H|T]):-
    writeln(H),
    imprime_selecoes(T).

mostra_selecoes(Saldo) :-
    nl,
    writeln("SELECOES: "),
    selecoes(R),
    imprime_selecoes(R),
    main2(Saldo).

ver_saldo(Saldo):- 
    write("Seu saldo e: "),  
    write(Saldo), nl,
    main2(Saldo). 

recarregar(Saldo):-  
    write("Digite o valor a ser recarregado: "),
    read(Num),                       
    NovoSaldo is Saldo + Num,
    main2(NovoSaldo).  

gols(Probabilidade,R):-
    random(0,Probabilidade, X),
    R is X.

get_selecao_nome(Nome, Saida) :- sub_string(Nome, 3, _, 0, Saida).

partida(Time1, Time2, R):-
    valor_selecoes(S),
    nth0(Time1,S, ForcaTime1),
    nth0(Time2,S, ForcaTime2),
    (ForcaTime1 > ForcaTime2 -> gols(7,R1);
    ForcaTime2 > ForcaTime1 -> gols(4,R2)),
    (ForcaTime1 < ForcaTime2 -> gols(4,R1);
    ForcaTime2 < ForcaTime1 -> gols(7,R2)),
    selecoes(NomeSelecoes),
    nth0(Time1,NomeSelecoes,Nome1),
    nth0(Time2,NomeSelecoes,Nome2),
    get_selecao_nome(Nome1, Saida1),
    get_selecao_nome(Nome2, Saida2),
    write("Resultado: "), write(Saida1), write(" "), write(R1),write(" X "),write(R2),write(" "), write(Saida2),nl,
    (R1 > R2 -> R is 1;
    R1 < R2 -> R is 2;
    R1 =:= R2 -> R is 0).

apostar(Saldo):-
    write("Digite o time 1: "),
    read(Time1),
    write("Digite o time 2: "),
    read(Time2),
    write("Digite o valor da aposta: "),
    read(ValorApostado),
    (ValorApostado > Saldo -> write("Saldo insuficiente"),main2(Saldo);
    partida(Time1,Time2, Resultado),
    (Resultado =:= 1 -> NovoSaldo is Saldo + ValorApostado, writeln("YOU WIN!");
    Resultado =:= 2 -> NovoSaldo is Saldo - ValorApostado,writeln("YOU LOSE!");
    Resultado =:= 0 -> NovoSaldo is Saldo,writeln("DRAW!")),
    main2(NovoSaldo)).

define_acao(Option,Saldo) :-
    (Option =:= 1 -> mostra_selecoes(Saldo);
    Option =:= 2 -> ver_saldo(Saldo);
    Option =:= 3 -> recarregar(Saldo);
    Option =:= 4 -> apostar(Saldo)).

main2(Saldo):-
    nl,
    write("Selecione:"), nl,
    write("1- ver selecoes"), nl,
    write("2- ver saldo"), nl,
    write("3- recarregar o saldo"), nl,
    write("4- Apostar"), nl,
    read(Option),
    define_acao(Option,Saldo),halt.

main:-
    nl,
    write("Selecione:"), nl,
    write("1- ver selecoes"), nl,
    write("2- ver saldo"), nl,
    write("3- recarregar o saldo"), nl,
    write("4- Apostar"), nl,
    read(Option),
    define_acao(Option,20),halt.
