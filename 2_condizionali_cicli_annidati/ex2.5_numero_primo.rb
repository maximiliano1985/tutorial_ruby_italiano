#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: ex2.5_numero_primo.rb
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
# funzione che verifica se un numero intero e` primo
#
def isprime?(n)
  for i in (2..n-1) do
    if (n%i) == 0 then # divisione senza resto -> non primo!
      return false ;
    end
  end
  return true ;
end
 
nmax = ARGV[0].to_i
nmax = 2 if nmax < 2
 
for i in (2..nmax) do
  if isprime?(i) then
    puts "i=#{i} e` primo"
  else
    puts "i=#{i} NON e` primo"
  end
end