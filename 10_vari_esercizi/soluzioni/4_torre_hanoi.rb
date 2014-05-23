#!/usr/bin/env ruby
#-------------------------------------------------------------------------#
#  Esercitazioni in Laboratorio per il Corso di                           #
#  Fondamenti di Informatica e Calcolo Numerico, AA 2013/2014             #
#                                                                         #
#  Autori:   Enrico Bertolazzi e Carlos Maximiliano Giorgio Bort          #
#            Dipartimento di Ingeneria Industriale, Universita` di Trento #
#  Sito web: http://www.ing.unitn.it/~bertolaz/                           #
#                                                                         #
#  Contatti: enrico.bertolazzi@unitn.it, cm.giorgiobort@unitn.it          #
#                                                                         #
#  Copyright (c) 2014 E.Bertolazzi e C.M. Giorgio Bort                    #
#-------------------------------------------------------------------------#


=begin
  Implementare una funzione 'solve_hanoi_tower' che risolva il gioco della Torre
  di Hanoi:

  La Torre di Hanoi e' un rompicapo matematico composto da tre paletti e un
  certo numero di dischi di grandezza decrescente, che possono essere infilati
  in uno qualsiasi dei paletti.
  Il gioco inizia con tutti i dischi incolonnati su un paletto in ordine
  decrescente, in modo da formare un cono. Lo scopo del gioco e' portare tutti i
  dischi sull'ultimo paletto, potendo spostare solo un disco alla volta e potendo
  mettere un disco solo su un altro disco piu' grande, mai su uno piu' piccolo.

  La soluzione base del gioco della torre di Hanoi si formula in modo ricorsivo.
  Siano i paletti etichettati con A, B e C, e i dischi numerati da 1
  (il piu' piccolo) a n (il piu' grande). L'algoritmo si esprime come segue:
  - Sposta i primi n-1 dischi da A a B. (Questo lascia il disco n da solo sul
      paletto A)
  - Sposta il disco n da A a C
  - Sposta n-1 dischi da B a C

Esercizio:
  Implementare una (o più) funzioni che risolvono la torre di Hanoi. Il codice 
  deve prevedere una funzione che si chiami 'solve_hanoi_tower', che accetti in
  ingresso il numero di dischi che stanno sullo stelo di partenza della torre
  e deve restituire un array con le mosse da compiere per risolvere il gioco.
  Tali mosse devono essere rappresentate da un array contenente due numeri: il
  numero dello stelo di partenza, ed il numero dello stelo di arrivo della mossa
  corrente. L'array delle mosse deve essere salvato in una variabile globale
  chiamata '$lista_movimenti'.
  E.g.: [[0,2], [0,1], [2,1], ...]
    significa che la prima mossa prevede di spostare un disco dallo stelo 0 (di
    partenza), allo stelo 2 (quello finale). La seconda mossa prevede di spostare
    un disco dallo stelo di partenza (0) a quello centrale (1). La terza mossa
    richiede di spostare un disco dallo stelo finale (2) a quello centrale (1),
    e così via...

  La funzione scritta deve essere testata con il seguente blocco di istruzioni:
%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%
n = 2
$torri = [[*1..n].reverse, [], []]
$lista_movimenti = []
solve_hanoi_tower(n)
puts $lista_movimenti.inspect
%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%

  N.B. includere nel codice la gestione degli errori.
=end



################################################################################
# RISOLVERE L'ESERCIZIO QUI
################################################################################

def move(num_dischi, start=0, target=2, usando=1)
  raise ArgumentError, "La funzione 'move' richiede come primo argomento un numero intero" unless num_dischi.class == Fixnum
  raise ArgumentError, "La funzione 'move' richiede come secondo argomento un numero intero compreso tra 0 e 2" unless start.class == Fixnum && [*0..2].include?(start)
  raise ArgumentError, "La funzione 'move' richiede come terzo argomento un numero intero compreso tra 0 e 2" unless target.class == Fixnum && [*0..2].include?(target)
  raise ArgumentError, "La funzione 'move' richiede come quarto argomento un numero intero compreso tra 0 e 2" unless usando.class == Fixnum && [*0..2].include?(usando)
  
  if num_dischi == 1
    disco = $torri[start].pop
    $torri[target] << disco
    puts "Muovo disco #{disco} da #{start} a #{target} : #{$torri}"
    $lista_movimenti << [start, target]
  else
    move(num_dischi-1, start, usando, target)
    move(1,            start, target, usando)
    move(num_dischi-1, usando, target, start)
  end 
end

def solve_hanoi_tower(num_dischi)
  $lista_movimenti.clear
  raise ArgumentError, "La funzione 'solve_hanoi_tower' richiede che il numero di dischi nel gioco sia un numero intero" unless num_dischi.class == Fixnum
  raise ArgumentError, "Il numero di dischi nel gioco deve essere un numero positivo e diverso da 0" unless num_dischi > 0
  move(num_dischi)
  return $lista_movimenti.dup
end

n = 5
$torri = [[*1..n].reverse, [], []]
$lista_movimenti = []
solve_hanoi_tower(n)

puts $lista_movimenti.inspect


################################################################################
# NON MODIFICARE LE LINEE DI CODICE RIPORTATE QUI DI SEGUITO
################################################################################
load "../checker.rb" if __FILE__ == $0