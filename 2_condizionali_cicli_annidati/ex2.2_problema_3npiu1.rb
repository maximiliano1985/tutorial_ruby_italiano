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
 
n = ARGV[0].to_i ; # primo argomento per inizializzare n
k = 0 ;
while n > 1 do
  k = k+1
  n = collatz(n)
  puts "k = #{k}, n = #{n}"
end

=begin
Per ottenere il grafico eseguire lo script e salvare l'output su file.
Ad esempio su Linux e OSX ruby ex2.3.rb > a.dat su WINDOWS ruby ex2.3.rb e poi
copiare l'output su un file. Usando gnuplot dare il comando:

    plot [2:] 'a.dat' u 1:2 with lines
=end