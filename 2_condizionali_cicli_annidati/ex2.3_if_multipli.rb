#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: ex2.3_if_multipli.rb
#
#  Autori:
#     Enrico Bertolazzi and Carlos Maximiliano Giorgio Bort
#     Dipartimento di Ingeneria Industriale
#     Università di Trento
#
#  Sito web:
#     http://www.ing.unitn.it/~bertolaz/
#
#  Contatti:
#     enrico.bertolazzi@unitn.it
#     cm.giorgiobort@unitn.it
#
#  Copyright (c) 2014 Università di Trento. Tutti i diritti riservati.
#     
#-------------------------------------------------------------------------

#
# Esempio, funzione 3n+1 di Collatz
#
# definisco la funzione collatz che accetta un solo
# argomento n
def collatz(n)
  if n.even? then
    # blocco eseguito se n e` numero pari
    return n/2 # esco restituendo il valore n/2
  else
    # blocco eseguito se n e` numero dispari
    return 3*n+1 # esco restituendo il valore 3*n+1
  end
end
#
# dato n conta le iterate fatte con Collatz
#
def iter(n)
  k = 0
  while n>1 do
    k = k+1
    n = collatz(n)
  end
  return k
end
 
n = ARGV[0].to_i ; # primo argomento per inizializzare n
#
# ciclo per j da 1 a n
#
puts "n\titer"
for j in (1..n) do
  it = iter(j)
  puts "#{j}\t#{it}"
end